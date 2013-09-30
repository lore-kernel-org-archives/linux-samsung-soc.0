From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v8] s5k5baf: add camera sensor driver
Date: Mon, 30 Sep 2013 09:20:54 +0100
Message-ID: <20130930082053.GA19738@e106331-lin.cambridge.arm.com>
References: <1378463466-14274-1-git-send-email-a.hajda@samsung.com>
 <20130920170600.GJ17453@e106331-lin.cambridge.arm.com>
 <5244361D.2040803@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5244361D.2040803-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

> >> diff --git a/Documentation/devicetree/bindings/media/samsung-s5k5baf.txt b/Documentation/devicetree/bindings/media/samsung-s5k5baf.txt
> >> new file mode 100644
> >> index 0000000..7704a1e
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/samsung-s5k5baf.txt
> >> @@ -0,0 +1,58 @@
> >> +Samsung S5K5BAF UXGA 1/5" 2M CMOS Image Sensor with embedded SoC ISP
> >> +--------------------------------------------------------------------
> >> +
> >> +Required properties:
> >> +
> >> +- compatible     : "samsung,s5k5baf";
> >> +- reg            : I2C slave address of the sensor;
> >> +- vdda-supply    : analog power supply 2.8V (2.6V to 3.0V);
> >> +- vddreg-supply          : regulator input power supply 1.8V (1.7V to 1.9V)
> >> +                   or 2.8V (2.6V to 3.0);
> >> +- vddio-supply   : I/O power supply 1.8V (1.65V to 1.95V)
> >> +                   or 2.8V (2.5V to 3.1V);
> >> +- stbyn-gpios    : GPIO connected to STDBYN pin;
> >> +- rstn-gpios     : GPIO connected to RSTN pin;
> >> +- clocks         : the sensor's master clock specifier (from the common
> >> +                   clock bindings);
> >> +- clock-names    : must be "mclk";
> > I'd reword this slightly:
> >
> > - clocks: clock-specifiers (per the common clock bindings) for the
> >   clocks described in clock-names
> OK
> > - clock-names: should include "mclk" for the sensor's master clock
> IMHO it suggests there could be more than one clock, is it OK?

In general I'd prefer things to be described in this way so as to not
describe any requirements on the order of clocks in the binding (and to
suggest that clocks should be requested by name in code).

Future hardware variants could have multiple clocks that we need to add
to bindings, or it's possible we miss some clocks in the initial version
of a binding. In either case it's easier to extend the binding and code
if clocks are described by name and requested by name.

> >
> >> +
> >> +Optional properties:
> >> +
> >> +- clock-frequency : the frequency at which the "mclk" clock should be
> >> +                   configured to operate, in Hz; if this property is not
> >> +                   specified default 24 MHz value will be used.
> >> +
> >> +The device node should contain one 'port' child node with one child 'endpoint'
> >> +node, according to the bindings defined in Documentation/devicetree/bindings/
> >> +media/video-interfaces.txt. The following are properties specific to those
> >> +nodes.
> >> +
> >> +endpoint node
> >> +-------------
> >> +
> >> +- data-lanes : (optional) specifies MIPI CSI-2 data lanes as covered in
> >> +  video-interfaces.txt. This sensor doesn't support data lane remapping
> >> +  and physical lane indexes in subsequent elements of the array should
> >> +  have consecutive values.
> > Do these need to start at 1, or may they have any initial value?
> After re-checking I have found some inconsistency in the specs,
> regarding lanes.
> Final conclusion is that sensor supports only one lane without re-mapping.
> I would then change description to:
> 
> - data-lanes : (optional) specifies MIPI CSI-2 data lanes as covered in
>   video-interfaces.txt. If present it should be <1> - the device supports only one data lane
>   without re-mapping.

OK. That sounds reasonable to me.

> 
> 
> >> +
> >> +Example:
> >> +
> >> +s5k5bafx@2d {
> >> +       compatible = "samsung,s5k5baf";
> >> +       reg = <0x2d>;
> >> +       vdda-supply = <&cam_io_en_reg>;
> >> +       vddreg-supply = <&vt_core_15v_reg>;
> >> +       vddio-supply = <&vtcam_reg>;
> >> +       stbyn-gpios = <&gpl2 0 1>;
> >> +       rstn-gpios = <&gpl2 1 1>;
> >> +       clock-names = "mclk";
> >> +       clocks = <&clock_cam 0>;
> >> +       clock-frequency = <24000000>;
> >> +
> >> +       port {
> >> +               s5k5bafx_ep: endpoint {
> >> +                       remote-endpoint = <&csis1_ep>;
> >> +                       data-lanes = <1>;
> >> +               };
> >> +       };
> >> +};
> > Otherwise, I think the binding looks fine.
> >
> > I took a quick skim over the driver and I have a few other comments.
> >
> > [...]
> >
> >> +enum s5k5baf_gpio_id {
> >> +       STBY,
> >> +       RST,
> >> +       GPIO_NUM,
> > I'd expect this to be NUM_GPIOS or MAX_GPIOS, as GPIO_NUM sounds like
> > the index for a GPIO, rather than how many GPIOs there are.
> OK
> >
> >> +};
> >> +
> >> +#define PAD_CIS 0
> >> +#define PAD_OUT 1
> >> +#define CIS_PAD_NUM 1
> >> +#define ISP_PAD_NUM 2
> > Similarly here, I think NUM_*S or MAX_*S is preferable.
> OK
> >
> > [...]
> >
> >> +static void s5k5baf_hw_patch(struct s5k5baf *state)
> >> +{
> >> +       static const u16 nseq_patch[] = {
> >> +               NSEQ(0x1668,
> >> +               0xb5fe, 0x0007, 0x683c, 0x687e, 0x1da5, 0x88a0, 0x2800, 0xd00b,
> >> +               0x88a8, 0x2800, 0xd008, 0x8820, 0x8829, 0x4288, 0xd301, 0x1a40,
> >> +               0xe000, 0x1a08, 0x9001, 0xe001, 0x2019, 0x9001, 0x4916, 0x466b,
> >> +               0x8a48, 0x8118, 0x8a88, 0x8158, 0x4814, 0x8940, 0x0040, 0x2103,
> >> +               0xf000, 0xf826, 0x88a1, 0x4288, 0xd908, 0x8828, 0x8030, 0x8868,
> >> +               0x8070, 0x88a8, 0x6038, 0xbcfe, 0xbc08, 0x4718, 0x88a9, 0x4288,
> >> +               0xd906, 0x8820, 0x8030, 0x8860, 0x8070, 0x88a0, 0x6038, 0xe7f2,
> >> +               0x9801, 0xa902, 0xf000, 0xf812, 0x0033, 0x0029, 0x9a02, 0x0020,
> >> +               0xf000, 0xf814, 0x6038, 0xe7e6, 0x1a28, 0x7000, 0x0d64, 0x7000,
> >> +               0x4778, 0x46c0, 0xf004, 0xe51f, 0xa464, 0x0000, 0x4778, 0x46c0,
> >> +               0xc000, 0xe59f, 0xff1c, 0xe12f, 0x6009, 0x0000, 0x4778, 0x46c0,
> >> +               0xc000, 0xe59f, 0xff1c, 0xe12f, 0x622f, 0x0000),
> > [... snipping another ~50 lines of binary blob ...]
> >
> > Could you please describe what this is precisely?
> >
> > This looks like a firmware blob, and I don't think this should be
> > embedded in the driver (see Documentation/firmware_class/README).
> >
> > It would be nice to have some description of the format of the other
> > binary dumps below if possible (even if by reference to a manual).
> The problem is that I do not have detailed specification, these blobs were
> taken from internal/android drivers. But in fact I could move all three
> blobs to 'firmware'
> file, it will look better :)

I think these should definitely be moved out of the driver.

Do you know what the legal situation of the blob is -- how is it
licensed?

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
