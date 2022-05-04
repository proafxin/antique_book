from gimpfu import *

# 1012982852
# 2826674371
# 2654604224
# Resolution: 370
# Pick: 15
# Horizontal: 3.5
# Vertical: 3.5
# Threshold low: .55
# Horizontal spread: 2
# Vertical spread: 2
def antiquify(image, rndm_pct, rndm_rcount, randomize, seed, horizontal, vertical, low_threshold, high_threshold, spread_amount_x, spread_amount_y):
    pdb.gimp_message('Antiquifying '+str(image.ID))
    # opacity = 80
    # pdb.gimp_context_set_opacity(opacity)
    pdb.gimp_undo_push_group_start(image)
    layers = image.layers
    for i, layer in enumerate(layers):
        # pdb.plug_in_randomize_pick(image,layer,rndm_pct, rndm_rcount, randomize, seed)
        pdb.plug_in_spread(image,layer,spread_amount_x, spread_amount_y)
        # pdb.plug_in_randomize_pick(image,layer,rndm_pct, rndm_rcount, randomize, seed)
        # pdb.plug_in_randomize_slur(image, layer, rndm_pct, rndm_rcount, randomize, seed)
        # pdb.plug_in_spread(image,layer,spread_amount_x, spread_amount_y)
        # pdb.plug_in_spread(image,layer,spread_amount_x, spread_amount_y)
        pdb.plug_in_randomize_slur(image, layer, rndm_pct, rndm_rcount, randomize, seed)
        pdb.plug_in_gauss(image, layer, horizontal, vertical, 0)
        pdb.gimp_drawable_threshold(layer, 0, low_threshold, high_threshold)
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
        (PF_SLIDER, "rndm_pct", "Random Percent for Pick", 15, (0, 100, .5)),
        (PF_SLIDER, "rndm_rcount", "Number of Iteration for Pick", 2, (0, 10, 1)),
        (PF_BOOL, "randomize", "Randomize or not for Pick", True),
        (PF_INT, "seed", "Seed of randomization for Pick", 2654604224),
        (PF_SLIDER, "horizontal", "Horizontal for Gaussian blur", 4, (0, 10, .5)),
        (PF_SLIDER, "vertical", "Vertical for Gaussian blur", 4, (0, 10, .5)),
        (PF_SLIDER, "low_threshold", "Threshold low", .5, (0, 1, .01)),
        (PF_SLIDER, "high_threshold", "Threshold high", 1, (0, 1, .01)),
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