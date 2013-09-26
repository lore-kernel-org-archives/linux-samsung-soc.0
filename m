From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v8] s5k5baf: add camera sensor driver
Date: Thu, 26 Sep 2013 15:26:53 +0200
Message-ID: <5244361D.2040803@samsung.com>
References: <1378463466-14274-1-git-send-email-a.hajda@samsung.com>
 <20130920170600.GJ17453@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20130920170600.GJ17453-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,

Thanks for the review, sorry for late response.

On 09/20/2013 07:06 PM, Mark Rutland wrote:
> On Fri, Sep 06, 2013 at 11:31:06AM +0100, Andrzej Hajda wrote:
>> Driver for Samsung S5K5BAF UXGA 1/5" 2M CMOS Image Sensor
>> with embedded SoC ISP.
>> The driver exposes the sensor as two V4L2 subdevices:
>> - S5K5BAF-CIS - pure CMOS Image Sensor, fixed 1600x1200 format,
>>   no controls.
>> - S5K5BAF-ISP - Image Signal Processor, formats up to 1600x1200,
>>   pre/post ISP cropping, downscaling via selection API, controls.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>> Hi,
>>
>> This is the 8th iteration of the patch.
>> I have applied suggestions from Laurent, Sylwester and Mark, thanks.
>> One exeception, I have left static struct v4l2_rect s5k5baf_cis_rect
>> not const due to fact its address is passed to function which could
>> modify its arguments, of course it never modifies s5k5baf_cis_rect.
>>
>> Regards
>> Andrzej
>>
>> v8
>> - improved description of data-lanes binding,
>> - added algorithm caching,
>> - added comments to functions,
>> - video bus type checking moved to probe,
>> - clk_get/put moved to probe,
>> - moved streaming checking under mutex,
>> - use proper functions for endian conversion,
>> - probe returns -EPROBE_DEFER in case it cannot get clock,
>> - v4l2_async_unregister_subdev is called on remove,
>> - cosmetic changes
>>
>> v7
>> - changed description of 'clock-frequency' DT property
>>
>> v6
>> - endpoint node presence is now optional,
>> - added asynchronous subdev registration support and clock
>>   handling,
>> - use named gpios in DT bindings
>>
>> v5
>> - removed hflip/vflip device tree properties
>>
>> v4
>> - GPL changed to GPLv2,
>> - bitfields replaced by u8,
>> - cosmetic changes,
>> - corrected s_stream flow,
>> - gpio pins are no longer exported,
>> - added I2C addresses to subdev names,
>> - CIS subdev registration postponed after
>>   succesfull HW initialization,
>> - added enums for pads,
>> - selections are initialized only during probe,
>> - default resolution changed to 1600x1200,
>> - state->error pattern removed from few other functions,
>> - entity link creation moved to registered callback.
>>
>> v3:
>> - narrowed state->error usage to i2c and power errors,
>> - private gain controls replaced by red/blue balance user controls,
>> - added checks to devicetree gpio node parsing
>>
>> v2:
>> - lower-cased driver name,
>> - removed underscore from regulator names,
>> - removed platform data code,
>> - v4l controls grouped in anonymous structs,
>> - added s5k5baf_clear_error function,
>> - private controls definitions moved to uapi header file,
>> - added v4l2-controls.h reservation for private controls,
>> - corrected subdev registered/unregistered code,
>> - .log_status sudbev op set to v4l2 helper,
>> - moved entity link creation to probe routines,
>> - added cleanup on error to probe function.
>> ---
>>  .../devicetree/bindings/media/samsung-s5k5baf.txt  |   58 +
>>  MAINTAINERS                                        |    7 +
>>  drivers/media/i2c/Kconfig                          |    7 +
>>  drivers/media/i2c/Makefile                         |    1 +
>>  drivers/media/i2c/s5k5baf.c                        | 2050 ++++++++++++++++++++
>>  5 files changed, 2123 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/samsung-s5k5baf.txt
>>  create mode 100644 drivers/media/i2c/s5k5baf.c
>>
>> diff --git a/Documentation/devicetree/bindings/media/samsung-s5k5baf.txt b/Documentation/devicetree/bindings/media/samsung-s5k5baf.txt
>> new file mode 100644
>> index 0000000..7704a1e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/samsung-s5k5baf.txt
>> @@ -0,0 +1,58 @@
>> +Samsung S5K5BAF UXGA 1/5" 2M CMOS Image Sensor with embedded SoC ISP
>> +--------------------------------------------------------------------
>> +
>> +Required properties:
>> +
>> +- compatible     : "samsung,s5k5baf";
>> +- reg            : I2C slave address of the sensor;
>> +- vdda-supply    : analog power supply 2.8V (2.6V to 3.0V);
>> +- vddreg-supply          : regulator input power supply 1.8V (1.7V to 1.9V)
>> +                   or 2.8V (2.6V to 3.0);
>> +- vddio-supply   : I/O power supply 1.8V (1.65V to 1.95V)
>> +                   or 2.8V (2.5V to 3.1V);
>> +- stbyn-gpios    : GPIO connected to STDBYN pin;
>> +- rstn-gpios     : GPIO connected to RSTN pin;
>> +- clocks         : the sensor's master clock specifier (from the common
>> +                   clock bindings);
>> +- clock-names    : must be "mclk";
> I'd reword this slightly:
>
> - clocks: clock-specifiers (per the common clock bindings) for the
>   clocks described in clock-names
OK
> - clock-names: should include "mclk" for the sensor's master clock
IMHO it suggests there could be more than one clock, is it OK?
>
>> +
>> +Optional properties:
>> +
>> +- clock-frequency : the frequency at which the "mclk" clock should be
>> +                   configured to operate, in Hz; if this property is not
>> +                   specified default 24 MHz value will be used.
>> +
>> +The device node should contain one 'port' child node with one child 'endpoint'
>> +node, according to the bindings defined in Documentation/devicetree/bindings/
>> +media/video-interfaces.txt. The following are properties specific to those
>> +nodes.
>> +
>> +endpoint node
>> +-------------
>> +
>> +- data-lanes : (optional) specifies MIPI CSI-2 data lanes as covered in
>> +  video-interfaces.txt. This sensor doesn't support data lane remapping
>> +  and physical lane indexes in subsequent elements of the array should
>> +  have consecutive values.
> Do these need to start at 1, or may they have any initial value?
After re-checking I have found some inconsistency in the specs,
regarding lanes.
Final conclusion is that sensor supports only one lane without re-mapping.
I would then change description to:

- data-lanes : (optional) specifies MIPI CSI-2 data lanes as covered in
  video-interfaces.txt. If present it should be <1> - the device supports only one data lane
  without re-mapping.


>> +
>> +Example:
>> +
>> +s5k5bafx@2d {
>> +       compatible = "samsung,s5k5baf";
>> +       reg = <0x2d>;
>> +       vdda-supply = <&cam_io_en_reg>;
>> +       vddreg-supply = <&vt_core_15v_reg>;
>> +       vddio-supply = <&vtcam_reg>;
>> +       stbyn-gpios = <&gpl2 0 1>;
>> +       rstn-gpios = <&gpl2 1 1>;
>> +       clock-names = "mclk";
>> +       clocks = <&clock_cam 0>;
>> +       clock-frequency = <24000000>;
>> +
>> +       port {
>> +               s5k5bafx_ep: endpoint {
>> +                       remote-endpoint = <&csis1_ep>;
>> +                       data-lanes = <1>;
>> +               };
>> +       };
>> +};
> Otherwise, I think the binding looks fine.
>
> I took a quick skim over the driver and I have a few other comments.
>
> [...]
>
>> +enum s5k5baf_gpio_id {
>> +       STBY,
>> +       RST,
>> +       GPIO_NUM,
> I'd expect this to be NUM_GPIOS or MAX_GPIOS, as GPIO_NUM sounds like
> the index for a GPIO, rather than how many GPIOs there are.
OK
>
>> +};
>> +
>> +#define PAD_CIS 0
>> +#define PAD_OUT 1
>> +#define CIS_PAD_NUM 1
>> +#define ISP_PAD_NUM 2
> Similarly here, I think NUM_*S or MAX_*S is preferable.
OK
>
> [...]
>
>> +static void s5k5baf_hw_patch(struct s5k5baf *state)
>> +{
>> +       static const u16 nseq_patch[] = {
>> +               NSEQ(0x1668,
>> +               0xb5fe, 0x0007, 0x683c, 0x687e, 0x1da5, 0x88a0, 0x2800, 0xd00b,
>> +               0x88a8, 0x2800, 0xd008, 0x8820, 0x8829, 0x4288, 0xd301, 0x1a40,
>> +               0xe000, 0x1a08, 0x9001, 0xe001, 0x2019, 0x9001, 0x4916, 0x466b,
>> +               0x8a48, 0x8118, 0x8a88, 0x8158, 0x4814, 0x8940, 0x0040, 0x2103,
>> +               0xf000, 0xf826, 0x88a1, 0x4288, 0xd908, 0x8828, 0x8030, 0x8868,
>> +               0x8070, 0x88a8, 0x6038, 0xbcfe, 0xbc08, 0x4718, 0x88a9, 0x4288,
>> +               0xd906, 0x8820, 0x8030, 0x8860, 0x8070, 0x88a0, 0x6038, 0xe7f2,
>> +               0x9801, 0xa902, 0xf000, 0xf812, 0x0033, 0x0029, 0x9a02, 0x0020,
>> +               0xf000, 0xf814, 0x6038, 0xe7e6, 0x1a28, 0x7000, 0x0d64, 0x7000,
>> +               0x4778, 0x46c0, 0xf004, 0xe51f, 0xa464, 0x0000, 0x4778, 0x46c0,
>> +               0xc000, 0xe59f, 0xff1c, 0xe12f, 0x6009, 0x0000, 0x4778, 0x46c0,
>> +               0xc000, 0xe59f, 0xff1c, 0xe12f, 0x622f, 0x0000),
> [... snipping another ~50 lines of binary blob ...]
>
> Could you please describe what this is precisely?
>
> This looks like a firmware blob, and I don't think this should be
> embedded in the driver (see Documentation/firmware_class/README).
>
> It would be nice to have some description of the format of the other
> binary dumps below if possible (even if by reference to a manual).
The problem is that I do not have detailed specification, these blobs were
taken from internal/android drivers. But in fact I could move all three
blobs to 'firmware'
file, it will look better :)

>
>> +/* set custom color correction matrices for various illuminations */
>> +static void s5k5baf_hw_set_ccm(struct s5k5baf *state)
>> +{
>> +       static const u16 nseq_cfg[] = {
>> +               NSEQ(REG_PTR_CCM_HORIZON,
>> +               REG_ARR_CCM(0), PAGE_IF_SW,
>> +               REG_ARR_CCM(1), PAGE_IF_SW,
>> +               REG_ARR_CCM(2), PAGE_IF_SW,
>> +               REG_ARR_CCM(3), PAGE_IF_SW,
>> +               REG_ARR_CCM(4), PAGE_IF_SW,
>> +               REG_ARR_CCM(5), PAGE_IF_SW),
>> +               NSEQ(REG_PTR_CCM_OUTDOOR,
>> +               REG_ARR_CCM(6), PAGE_IF_SW),
>> +               NSEQ(REG_ARR_CCM(0),
>> +               /* horizon */
>> +               0x010d, 0xffa7, 0xfff5, 0x003b, 0x00ef, 0xff38,
>> +               0xfe42, 0x0270, 0xff71, 0xfeed, 0x0198, 0x0198,
>> +               0xff95, 0xffa3, 0x0260, 0x00ec, 0xff33, 0x00f4,
>> +               /* incandescent */
>> +               0x010d, 0xffa7, 0xfff5, 0x003b, 0x00ef, 0xff38,
>> +               0xfe42, 0x0270, 0xff71, 0xfeed, 0x0198, 0x0198,
>> +               0xff95, 0xffa3, 0x0260, 0x00ec, 0xff33, 0x00f4,
>> +               /* warm white */
>> +               0x01ea, 0xffb9, 0xffdb, 0x0127, 0x0109, 0xff3c,
>> +               0xff2b, 0x021b, 0xff48, 0xff03, 0x0207, 0x0113,
>> +               0xffca, 0xff93, 0x016f, 0x0164, 0xff55, 0x0163,
>> +               /* cool white */
>> +               0x01ea, 0xffb9, 0xffdb, 0x0127, 0x0109, 0xff3c,
>> +               0xff2b, 0x021b, 0xff48, 0xff03, 0x0207, 0x0113,
>> +               0xffca, 0xff93, 0x016f, 0x0164, 0xff55, 0x0163,
>> +               /* daylight 5000K */
>> +               0x0194, 0xffad, 0xfffe, 0x00c5, 0x0103, 0xff5d,
>> +               0xfee3, 0x01ae, 0xff27, 0xff18, 0x018f, 0x00c8,
>> +               0xffe8, 0xffaa, 0x01c8, 0x0132, 0xff3e, 0x0100,
>> +               /* daylight 6500K */
>> +               0x0194, 0xffad, 0xfffe, 0x00c5, 0x0103, 0xff5d,
>> +               0xfee3, 0x01ae, 0xff27, 0xff18, 0x018f, 0x00c8,
>> +               0xffe8, 0xffaa, 0x01c8, 0x0132, 0xff3e, 0x0100,
>> +               /* outdoor */
>> +               0x01cc, 0xffc3, 0x0009, 0x00a2, 0x0106, 0xff3f,
>> +               0xfed8, 0x01fe, 0xff08, 0xfec7, 0x00f5, 0x0119,
>> +               0xffdf, 0x0024, 0x01a8, 0x0170, 0xffad, 0x011b),
>> +               0
>> +       };
>> +       s5k5baf_write_nseq(state, nseq_cfg);
>> +}
>> +
>> +/* CIS sensor tuning, based on undocumented android driver code */
>> +static void s5k5baf_hw_set_cis(struct s5k5baf *state)
>> +{
>> +       static const u16 nseq_cfg[] = {
>> +               NSEQ(0xc202, 0x0700),
>> +               NSEQ(0xf260, 0x0001),
>> +               NSEQ(0xf414, 0x0030),
>> +               NSEQ(0xc204, 0x0100),
>> +               NSEQ(0xf402, 0x0092, 0x007f),
>> +               NSEQ(0xf700, 0x0040),
>> +               NSEQ(0xf708,
>> +               0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
>> +               0x0040, 0x0040, 0x0040, 0x0040, 0x0040,
>> +               0x0001, 0x0015, 0x0001, 0x0040),
>> +               NSEQ(0xf48a, 0x0048),
>> +               NSEQ(0xf10a, 0x008b),
>> +               NSEQ(0xf900, 0x0067),
>> +               NSEQ(0xf406, 0x0092, 0x007f, 0x0003, 0x0003, 0x0003),
>> +               NSEQ(0xf442, 0x0000, 0x0000),
>> +               NSEQ(0xf448, 0x0000),
>> +               NSEQ(0xf456, 0x0001, 0x0010, 0x0000),
>> +               NSEQ(0xf41a, 0x00ff, 0x0003, 0x0030),
>> +               NSEQ(0xf410, 0x0001, 0x0000),
>> +               NSEQ(0xf416, 0x0001),
>> +               NSEQ(0xf424, 0x0000),
>> +               NSEQ(0xf422, 0x0000),
>> +               NSEQ(0xf41e, 0x0000),
>> +               NSEQ(0xf428, 0x0000, 0x0000, 0x0000),
>> +               NSEQ(0xf430, 0x0000, 0x0000, 0x0008, 0x0005, 0x000f, 0x0001,
>> +               0x0040, 0x0040, 0x0010),
>> +               NSEQ(0xf4d6, 0x0090, 0x0000),
>> +               NSEQ(0xf47c, 0x000c, 0x0000),
>> +               NSEQ(0xf49a, 0x0008, 0x0000),
>> +               NSEQ(0xf4a2, 0x0008, 0x0000),
>> +               NSEQ(0xf4b2, 0x0013, 0x0000, 0x0013, 0x0000),
>> +               NSEQ(0xf4aa, 0x009b, 0x00fb, 0x009b, 0x00fb),
>> +               0
>> +       };
>> +
>> +       s5k5baf_i2c_write(state, REG_CMDWR_PAGE, PAGE_IF_HW);
>> +       s5k5baf_write_nseq(state, nseq_cfg);
>> +       s5k5baf_i2c_write(state, REG_CMDWR_PAGE, PAGE_IF_SW);
>> +}
> Cheers,
> Mark.
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
