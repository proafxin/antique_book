from gimpfu import *

# 1012982852
# 2826674371
# 2654604224

def antiquify(image, rndm_pct, rndm_rcount, randomize, seed, horizontal, vertical, low_threshold, high_threshold, spread_amount_x, spread_amount_y):
    pdb.gimp_message('Antiquifying '+str(image.ID))
    # opacity = 80
    # pdb.gimp_context_set_opacity(opacity)
    pdb.gimp_undo_push_group_start(image)
    layers = image.layers
    for i, layer in enumerate(layers):
        # pdb.plug_in_randomize_pick(image,layer,rndm_pct, rndm_rcount, randomize, seed)
        pdb.plug_in_spread(image,layer,spread_amount_x, spread_amount_y)
        # pdb.plug_in_randomize_slur(image, layer, rndm_pct, rndm_rcount, randomize, seed)
        pdb.plug_in_spread(image,layer,spread_amount_x, spread_amount_y)
        pdb.plug_in_spread(image,layer,spread_amount_x, spread_amount_y)
        pdb.plug_in_gauss_rle2(image,layer,horizontal, vertical)
        # opacity = 97.2
        # pdb.gimp_context_set_opacity(opacity)
        pdb.gimp_threshold(layer, low_threshold, high_threshold)
        # pdb.plug_in_randomize_slur(image, layer, rndm_pct, rndm_rcount, randomize, seed)
        # pdb.plug_in_randomize_slur(image, layer, rndm_pct, rndm_rcount, randomize, seed)
        # pdb.plug_in_randomize_pick(image,layer,rndm_pct/2, rndm_rcount, randomize, seed)
        pdb.gimp_message('Processed layer: '+str(i+1))
    pdb.gimp_undo_push_group_end(image)
    pdb.gimp_message('All processing done.')

register(
    "python-fu-antiquify",
    "Make a LaTeX document antique",
    "",
    "Masum Billal",
    "Masum Billal",
    "2022",
    "Antiquify",
    "",
    [
        # basic parameters are: (UI_ELEMENT, "variable", "label", Default)
        (PF_IMAGE, "image", "takes current image", None),
        (PF_SLIDER, "rndm_pct", "Random Percent for Pick", 10, (0, 100, .5)),
        (PF_SLIDER, "rndm_rcount", "Number of Iteration for Pick", 1, (0, 10, 1)),
        (PF_BOOL, "randomize", "Randomize or not for Pick", True),
        (PF_INT, "seed", "Seed of randomization for Pick", 1),
        (PF_SLIDER, "horizontal", "Horizontal for Gaussian blur", 2, (0, 10, .5)),
        (PF_SLIDER, "vertical", "Vertical for Gaussian blur", .5, (0, 10, .5)),
        (PF_SLIDER, "low_threshold", "Threshold low", 200, (0, 255, 1)),
        (PF_SLIDER, "high_threshold", "Threshold high", 255, (0, 255, 1)),
        (PF_SLIDER, "spread_amount_x", "Horizontal spread", 2, (0, 20, 1)),
        (PF_SLIDER, "spread_amount_y", "Vertical spread", 2, (0, 20, 1)),
        # (PF_STRING, "filename", "PDF Filename", None),
        # (PF_SLIDER, "chunk", "Process images per cycle", 10, (1, 200, 1)),
    ],
    [],
    antiquify,
    menu="<Image>/Filters/Noise",
)

main()