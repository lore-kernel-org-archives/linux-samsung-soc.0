From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: using drm_display_mode timings for exynos4
Date: Wed, 27 Feb 2013 11:55:42 +0530
Message-ID: <CAPdUM4NxqFpseW5dXvQ+uQYogbpxTmMcCFMgnoSi4aepoZxGMA@mail.gmail.com>
References: <1361539959-15309-1-git-send-email-rahul.sharma@samsung.com>
	<CAOw6vbK7WjgQH-p_MJy68UdySLP1mEkwYXqBGqHd0oP6DAnSuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:59521 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750715Ab3B0GZo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 01:25:44 -0500
Received: by mail-wi0-f175.google.com with SMTP id l13so5798761wie.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Feb 2013 22:25:43 -0800 (PST)
In-Reply-To: <CAOw6vbK7WjgQH-p_MJy68UdySLP1mEkwYXqBGqHd0oP6DAnSuw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@google.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, InKi Dae <inki.dae@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>

Thanks Sean,

On Tue, Feb 26, 2013 at 11:33 PM, Sean Paul <seanpaul@google.com> wrote:
> On Fri, Feb 22, 2013 at 8:32 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> Exynos5 is already using drm_display_mode for timings parameters. Exynos4
>> is also modifed to use the same. List of supported resolutions and
>> corresponding timings are removed which helps is enabling some extra
>> resolutions. It also cleans some of the duplicate code.
>>
>
> Cool!
>
>> Exynos4 and Exynos5 Mixers, work fine for the same range of resolutions. Hence
>> same condition (to find the supported mode) is applied to both.
>>
>> More exynos4 phy configs can be added later to extend the mode supprot.
>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>> It is based on exynos-drm-next-todo branch at
>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>>
>>  drivers/gpu/drm/exynos/exynos_hdmi.c  | 659 +++++++++++++---------------------
>>  drivers/gpu/drm/exynos/exynos_mixer.c |   4 -
>>  2 files changed, 246 insertions(+), 417 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> index 273a6ea..09e82a0 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -109,7 +109,20 @@ struct hdmi_tg_regs {
>>         u8 tg_3d[1];
>>  };
>>
>> -struct hdmi_core_regs {
>> +struct hdmi_v13_core_regs {
>> +       u8 h_blank[2];
>> +       u8 v_blank[3];
>> +       u8 h_v_line[3];
>> +       u8 vsync_pol[1];
>> +       u8 int_pro_mode[1];
>> +       u8 v_blank_f[3];
>> +       u8 h_sync_gen[3];
>> +       u8 v_sync_gen1[3];
>> +       u8 v_sync_gen2[3];
>> +       u8 v_sync_gen3[3];
>> +};
>
> If you're going to do this refactor, I think you should try to merge
> the various v13/v14 structures. They're pretty close as-is and this
> would cut a bunch of duplicate code out of the driver.
>
> Sean
>

I have tried to merge them. I kept common hdmi_tg_regs
for v13 and v14 (v14 TG regs are extension to v13 TG regs).
But hdmi_core_regs fields are one to one mapped with Hdmi
Core Register which are bit different in both the versions.

Additionally, using common hdmi_conf_regs which have unions
for each hw version. A new version can be seamlessly added
to the list.

Please tell me specific region for improvements.

regards,
Rahul Sharma.

>> +
>> +struct hdmi_v14_core_regs {
>>         u8 h_blank[2];
>>         u8 v2_blank[2];
>>         u8 v1_blank[2];
>> @@ -148,11 +161,23 @@ struct hdmi_core_regs {
>>         u8 vact_space_6[2];
>>  };
>>
>> +struct hdmi_v13_conf {
>> +       struct hdmi_v13_core_regs core;
>> +       struct hdmi_tg_regs tg;
>> +};
>> +
>>  struct hdmi_v14_conf {
>> -       int pixel_clock;
>> -       struct hdmi_core_regs core;
>> +       struct hdmi_v14_core_regs core;
>>         struct hdmi_tg_regs tg;
>> +};
>> +
>> +struct hdmi_conf_regs {
>> +       int pixel_clock;
>>         int cea_video_id;
>> +       union {
>> +               struct hdmi_v13_conf v13_conf;
>> +               struct hdmi_v14_conf v14_conf;
>> +       } conf;
>>  };
>>
>>  struct hdmi_context {
>> @@ -171,9 +196,8 @@ struct hdmi_context {
>>         struct i2c_client               *ddc_port;
>>         struct i2c_client               *hdmiphy_port;
>>
>> -       /* current hdmiphy conf index */
>> -       int cur_conf;
>> -       struct hdmi_v14_conf            mode_conf;
>> +       /* current hdmiphy conf regs */
>> +       struct hdmi_conf_regs           mode_conf;
>>
>>         struct hdmi_resources           res;
>>
>> @@ -182,292 +206,60 @@ struct hdmi_context {
>>         enum hdmi_type                  type;
>>  };
>>
>> -/* HDMI Version 1.3 */
>> -static const u8 hdmiphy_v13_conf27[32] = {
>> -       0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30, 0x40,
>> -       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
>> -       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>> -       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
>> -};
>> -
>> -static const u8 hdmiphy_v13_conf27_027[32] = {
>> -       0x01, 0x05, 0x00, 0xD4, 0x10, 0x9C, 0x09, 0x64,
>> -       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
>> -       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>> -       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
>> -};
>> -
>> -static const u8 hdmiphy_v13_conf74_175[32] = {
>> -       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xef, 0x5B,
>> -       0x6D, 0x10, 0x01, 0x51, 0xef, 0xF3, 0x54, 0xb9,
>> -       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>> -       0x22, 0x40, 0xa5, 0x26, 0x01, 0x00, 0x00, 0x00,
>> -};
>> -
>> -static const u8 hdmiphy_v13_conf74_25[32] = {
>> -       0x01, 0x05, 0x00, 0xd8, 0x10, 0x9c, 0xf8, 0x40,
>> -       0x6a, 0x10, 0x01, 0x51, 0xff, 0xf1, 0x54, 0xba,
>> -       0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xe0,
>> -       0x22, 0x40, 0xa4, 0x26, 0x01, 0x00, 0x00, 0x00,
>> -};
>> -
>> -static const u8 hdmiphy_v13_conf148_5[32] = {
>> -       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xf8, 0x40,
>> -       0x6A, 0x18, 0x00, 0x51, 0xff, 0xF1, 0x54, 0xba,
>> -       0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xE0,
>> -       0x22, 0x40, 0xa4, 0x26, 0x02, 0x00, 0x00, 0x00,
>> -};
>> -
>> -struct hdmi_v13_tg_regs {
>> -       u8 cmd;
>> -       u8 h_fsz_l;
>> -       u8 h_fsz_h;
>> -       u8 hact_st_l;
>> -       u8 hact_st_h;
>> -       u8 hact_sz_l;
>> -       u8 hact_sz_h;
>> -       u8 v_fsz_l;
>> -       u8 v_fsz_h;
>> -       u8 vsync_l;
>> -       u8 vsync_h;
>> -       u8 vsync2_l;
>> -       u8 vsync2_h;
>> -       u8 vact_st_l;
>> -       u8 vact_st_h;
>> -       u8 vact_sz_l;
>> -       u8 vact_sz_h;
>> -       u8 field_chg_l;
>> -       u8 field_chg_h;
>> -       u8 vact_st2_l;
>> -       u8 vact_st2_h;
>> -       u8 vsync_top_hdmi_l;
>> -       u8 vsync_top_hdmi_h;
>> -       u8 vsync_bot_hdmi_l;
>> -       u8 vsync_bot_hdmi_h;
>> -       u8 field_top_hdmi_l;
>> -       u8 field_top_hdmi_h;
>> -       u8 field_bot_hdmi_l;
>> -       u8 field_bot_hdmi_h;
>> -};
>> -
>> -struct hdmi_v13_core_regs {
>> -       u8 h_blank[2];
>> -       u8 v_blank[3];
>> -       u8 h_v_line[3];
>> -       u8 vsync_pol[1];
>> -       u8 int_pro_mode[1];
>> -       u8 v_blank_f[3];
>> -       u8 h_sync_gen[3];
>> -       u8 v_sync_gen1[3];
>> -       u8 v_sync_gen2[3];
>> -       u8 v_sync_gen3[3];
>> -};
>> -
>> -struct hdmi_v13_preset_conf {
>> -       struct hdmi_v13_core_regs core;
>> -       struct hdmi_v13_tg_regs tg;
>> -};
>> -
>> -struct hdmi_v13_conf {
>> -       int width;
>> -       int height;
>> -       int vrefresh;
>> -       bool interlace;
>> -       int cea_video_id;
>> -       const u8 *hdmiphy_data;
>> -       const struct hdmi_v13_preset_conf *conf;
>> -};
>> -
>> -static const struct hdmi_v13_preset_conf hdmi_v13_conf_480p = {
>> -       .core = {
>> -               .h_blank = {0x8a, 0x00},
>> -               .v_blank = {0x0d, 0x6a, 0x01},
>> -               .h_v_line = {0x0d, 0xa2, 0x35},
>> -               .vsync_pol = {0x01},
>> -               .int_pro_mode = {0x00},
>> -               .v_blank_f = {0x00, 0x00, 0x00},
>> -               .h_sync_gen = {0x0e, 0x30, 0x11},
>> -               .v_sync_gen1 = {0x0f, 0x90, 0x00},
>> -               /* other don't care */
>> -       },
>> -       .tg = {
>> -               0x00, /* cmd */
>> -               0x5a, 0x03, /* h_fsz */
>> -               0x8a, 0x00, 0xd0, 0x02, /* hact */
>> -               0x0d, 0x02, /* v_fsz */
>> -               0x01, 0x00, 0x33, 0x02, /* vsync */
>> -               0x2d, 0x00, 0xe0, 0x01, /* vact */
>> -               0x33, 0x02, /* field_chg */
>> -               0x49, 0x02, /* vact_st2 */
>> -               0x01, 0x00, 0x33, 0x02, /* vsync top/bot */
>> -               0x01, 0x00, 0x33, 0x02, /* field top/bot */
>> -       },
>> -};
>> -
>> -static const struct hdmi_v13_preset_conf hdmi_v13_conf_720p60 = {
>> -       .core = {
>> -               .h_blank = {0x72, 0x01},
>> -               .v_blank = {0xee, 0xf2, 0x00},
>> -               .h_v_line = {0xee, 0x22, 0x67},
>> -               .vsync_pol = {0x00},
>> -               .int_pro_mode = {0x00},
>> -               .v_blank_f = {0x00, 0x00, 0x00}, /* don't care */
>> -               .h_sync_gen = {0x6c, 0x50, 0x02},
>> -               .v_sync_gen1 = {0x0a, 0x50, 0x00},
>> -               .v_sync_gen2 = {0x01, 0x10, 0x00},
>> -               .v_sync_gen3 = {0x01, 0x10, 0x00},
>> -               /* other don't care */
>> -       },
>> -       .tg = {
>> -               0x00, /* cmd */
>> -               0x72, 0x06, /* h_fsz */
>> -               0x71, 0x01, 0x01, 0x05, /* hact */
>> -               0xee, 0x02, /* v_fsz */
>> -               0x01, 0x00, 0x33, 0x02, /* vsync */
>> -               0x1e, 0x00, 0xd0, 0x02, /* vact */
>> -               0x33, 0x02, /* field_chg */
>> -               0x49, 0x02, /* vact_st2 */
>> -               0x01, 0x00, 0x01, 0x00, /* vsync top/bot */
>> -               0x01, 0x00, 0x33, 0x02, /* field top/bot */
>> -       },
>> -};
>> -
>> -static const struct hdmi_v13_preset_conf hdmi_v13_conf_1080i50 = {
>> -       .core = {
>> -               .h_blank = {0xd0, 0x02},
>> -               .v_blank = {0x32, 0xB2, 0x00},
>> -               .h_v_line = {0x65, 0x04, 0xa5},
>> -               .vsync_pol = {0x00},
>> -               .int_pro_mode = {0x01},
>> -               .v_blank_f = {0x49, 0x2A, 0x23},
>> -               .h_sync_gen = {0x0E, 0xEA, 0x08},
>> -               .v_sync_gen1 = {0x07, 0x20, 0x00},
>> -               .v_sync_gen2 = {0x39, 0x42, 0x23},
>> -               .v_sync_gen3 = {0x38, 0x87, 0x73},
>> -               /* other don't care */
>> -       },
>> -       .tg = {
>> -               0x00, /* cmd */
>> -               0x50, 0x0A, /* h_fsz */
>> -               0xCF, 0x02, 0x81, 0x07, /* hact */
>> -               0x65, 0x04, /* v_fsz */
>> -               0x01, 0x00, 0x33, 0x02, /* vsync */
>> -               0x16, 0x00, 0x1c, 0x02, /* vact */
>> -               0x33, 0x02, /* field_chg */
>> -               0x49, 0x02, /* vact_st2 */
>> -               0x01, 0x00, 0x33, 0x02, /* vsync top/bot */
>> -               0x01, 0x00, 0x33, 0x02, /* field top/bot */
>> -       },
>> +struct hdmiphy_config {
>> +       int pixel_clock;
>> +       u8 conf[32];
>>  };
>>
>> -static const struct hdmi_v13_preset_conf hdmi_v13_conf_1080p50 = {
>> -       .core = {
>> -               .h_blank = {0xd0, 0x02},
>> -               .v_blank = {0x65, 0x6c, 0x01},
>> -               .h_v_line = {0x65, 0x04, 0xa5},
>> -               .vsync_pol = {0x00},
>> -               .int_pro_mode = {0x00},
>> -               .v_blank_f = {0x00, 0x00, 0x00}, /* don't care */
>> -               .h_sync_gen = {0x0e, 0xea, 0x08},
>> -               .v_sync_gen1 = {0x09, 0x40, 0x00},
>> -               .v_sync_gen2 = {0x01, 0x10, 0x00},
>> -               .v_sync_gen3 = {0x01, 0x10, 0x00},
>> -               /* other don't care */
>> -       },
>> -       .tg = {
>> -               0x00, /* cmd */
>> -               0x50, 0x0A, /* h_fsz */
>> -               0xCF, 0x02, 0x81, 0x07, /* hact */
>> -               0x65, 0x04, /* v_fsz */
>> -               0x01, 0x00, 0x33, 0x02, /* vsync */
>> -               0x2d, 0x00, 0x38, 0x04, /* vact */
>> -               0x33, 0x02, /* field_chg */
>> -               0x48, 0x02, /* vact_st2 */
>> -               0x01, 0x00, 0x01, 0x00, /* vsync top/bot */
>> -               0x01, 0x00, 0x33, 0x02, /* field top/bot */
>> +/* list of phy config settings */
>> +static const struct hdmiphy_config hdmiphy_v13_configs[] = {
>> +       {
>> +               .pixel_clock = 27000000,
>> +               .conf = {
>> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30, 0x40,
>> +                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
>> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>> +                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
>> +               },
>>         },
>> -};
>> -
>> -static const struct hdmi_v13_preset_conf hdmi_v13_conf_1080i60 = {
>> -       .core = {
>> -               .h_blank = {0x18, 0x01},
>> -               .v_blank = {0x32, 0xB2, 0x00},
>> -               .h_v_line = {0x65, 0x84, 0x89},
>> -               .vsync_pol = {0x00},
>> -               .int_pro_mode = {0x01},
>> -               .v_blank_f = {0x49, 0x2A, 0x23},
>> -               .h_sync_gen = {0x56, 0x08, 0x02},
>> -               .v_sync_gen1 = {0x07, 0x20, 0x00},
>> -               .v_sync_gen2 = {0x39, 0x42, 0x23},
>> -               .v_sync_gen3 = {0xa4, 0x44, 0x4a},
>> -               /* other don't care */
>> +       {
>> +               .pixel_clock = 27027000,
>> +               .conf = {
>> +                       0x01, 0x05, 0x00, 0xD4, 0x10, 0x9C, 0x09, 0x64,
>> +                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
>> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>> +                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
>> +               },
>>         },
>> -       .tg = {
>> -               0x00, /* cmd */
>> -               0x98, 0x08, /* h_fsz */
>> -               0x17, 0x01, 0x81, 0x07, /* hact */
>> -               0x65, 0x04, /* v_fsz */
>> -               0x01, 0x00, 0x33, 0x02, /* vsync */
>> -               0x16, 0x00, 0x1c, 0x02, /* vact */
>> -               0x33, 0x02, /* field_chg */
>> -               0x49, 0x02, /* vact_st2 */
>> -               0x01, 0x00, 0x33, 0x02, /* vsync top/bot */
>> -               0x01, 0x00, 0x33, 0x02, /* field top/bot */
>> +       {
>> +               .pixel_clock = 74176000,
>> +               .conf = {
>> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xef, 0x5B,
>> +                       0x6D, 0x10, 0x01, 0x51, 0xef, 0xF3, 0x54, 0xb9,
>> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>> +                       0x22, 0x40, 0xa5, 0x26, 0x01, 0x00, 0x00, 0x00,
>> +               },
>>         },
>> -};
>> -
>> -static const struct hdmi_v13_preset_conf hdmi_v13_conf_1080p60 = {
>> -       .core = {
>> -               .h_blank = {0x18, 0x01},
>> -               .v_blank = {0x65, 0x6c, 0x01},
>> -               .h_v_line = {0x65, 0x84, 0x89},
>> -               .vsync_pol = {0x00},
>> -               .int_pro_mode = {0x00},
>> -               .v_blank_f = {0x00, 0x00, 0x00}, /* don't care */
>> -               .h_sync_gen = {0x56, 0x08, 0x02},
>> -               .v_sync_gen1 = {0x09, 0x40, 0x00},
>> -               .v_sync_gen2 = {0x01, 0x10, 0x00},
>> -               .v_sync_gen3 = {0x01, 0x10, 0x00},
>> -               /* other don't care */
>> +       {
>> +               .pixel_clock = 74250000,
>> +               .conf = {
>> +                       0x01, 0x05, 0x00, 0xd8, 0x10, 0x9c, 0xf8, 0x40,
>> +                       0x6a, 0x10, 0x01, 0x51, 0xff, 0xf1, 0x54, 0xba,
>> +                       0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xe0,
>> +                       0x22, 0x40, 0xa4, 0x26, 0x01, 0x00, 0x00, 0x00,
>> +               },
>>         },
>> -       .tg = {
>> -               0x00, /* cmd */
>> -               0x98, 0x08, /* h_fsz */
>> -               0x17, 0x01, 0x81, 0x07, /* hact */
>> -               0x65, 0x04, /* v_fsz */
>> -               0x01, 0x00, 0x33, 0x02, /* vsync */
>> -               0x2d, 0x00, 0x38, 0x04, /* vact */
>> -               0x33, 0x02, /* field_chg */
>> -               0x48, 0x02, /* vact_st2 */
>> -               0x01, 0x00, 0x01, 0x00, /* vsync top/bot */
>> -               0x01, 0x00, 0x33, 0x02, /* field top/bot */
>> +       {
>> +               .pixel_clock = 148500000,
>> +               .conf = {
>> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x9C, 0xf8, 0x40,
>> +                       0x6A, 0x18, 0x00, 0x51, 0xff, 0xF1, 0x54, 0xba,
>> +                       0x84, 0x00, 0x10, 0x38, 0x00, 0x08, 0x10, 0xE0,
>> +                       0x22, 0x40, 0xa4, 0x26, 0x02, 0x00, 0x00, 0x00,
>> +               },
>>         },
>>  };
>>
>> -static const struct hdmi_v13_conf hdmi_v13_confs[] = {
>> -       { 1280, 720, 60, false, 4, hdmiphy_v13_conf74_25,
>> -                       &hdmi_v13_conf_720p60 },
>> -       { 1280, 720, 50, false, 19, hdmiphy_v13_conf74_25,
>> -                       &hdmi_v13_conf_720p60 },
>> -       { 720, 480, 60, false, 3, hdmiphy_v13_conf27_027,
>> -                       &hdmi_v13_conf_480p },
>> -       { 1920, 1080, 50, true, 20, hdmiphy_v13_conf74_25,
>> -                       &hdmi_v13_conf_1080i50 },
>> -       { 1920, 1080, 50, false, 31, hdmiphy_v13_conf148_5,
>> -                       &hdmi_v13_conf_1080p50 },
>> -       { 1920, 1080, 60, true, 5, hdmiphy_v13_conf74_25,
>> -                       &hdmi_v13_conf_1080i60 },
>> -       { 1920, 1080, 60, false, 16, hdmiphy_v13_conf148_5,
>> -                       &hdmi_v13_conf_1080p60 },
>> -};
>> -
>> -/* HDMI Version 1.4 */
>> -struct hdmiphy_config {
>> -       int pixel_clock;
>> -       u8 conf[32];
>> -};
>> -
>> -/* list of all required phy config settings */
>>  static const struct hdmiphy_config hdmiphy_v14_configs[] = {
>>         {
>>                 .pixel_clock = 25200000,
>> @@ -875,22 +667,6 @@ static void hdmi_regs_dump(struct hdmi_context *hdata, char *prefix)
>>                 hdmi_v14_regs_dump(hdata, prefix);
>>  }
>>
>> -static int hdmi_v13_conf_index(struct drm_display_mode *mode)
>> -{
>> -       int i;
>> -
>> -       for (i = 0; i < ARRAY_SIZE(hdmi_v13_confs); ++i)
>> -               if (hdmi_v13_confs[i].width == mode->hdisplay &&
>> -                               hdmi_v13_confs[i].height == mode->vdisplay &&
>> -                               hdmi_v13_confs[i].vrefresh == mode->vrefresh &&
>> -                               hdmi_v13_confs[i].interlace ==
>> -                               ((mode->flags & DRM_MODE_FLAG_INTERLACE) ?
>> -                                true : false))
>> -                       return i;
>> -
>> -       return -EINVAL;
>> -}
>> -
>>  static u8 hdmi_chksum(struct hdmi_context *hdata,
>>                         u32 start, u8 len, u32 hdr_sum)
>>  {
>> @@ -945,11 +721,7 @@ static void hdmi_reg_infoframe(struct hdmi_context *hdata,
>>                 hdmi_reg_writeb(hdata, HDMI_AVI_BYTE(2), aspect_ratio |
>>                                 AVI_SAME_AS_PIC_ASPECT_RATIO);
>>
>> -               if (hdata->type == HDMI_TYPE13)
>> -                       vic = hdmi_v13_confs[hdata->cur_conf].cea_video_id;
>> -               else
>> -                       vic = hdata->mode_conf.cea_video_id;
>> -
>> +               vic = hdata->mode_conf.cea_video_id;
>>                 hdmi_reg_writeb(hdata, HDMI_AVI_BYTE(4), vic);
>>
>>                 chksum = hdmi_chksum(hdata, HDMI_AVI_BYTE(1),
>> @@ -1002,63 +774,34 @@ static struct edid *hdmi_get_edid(void *ctx, struct drm_connector *connector)
>>         return raw_edid;
>>  }
>>
>> -static int hdmi_v13_check_timing(struct fb_videomode *check_timing)
>> +static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
>>  {
>> -       int i;
>> -
>> -       DRM_DEBUG_KMS("valid mode : xres=%d, yres=%d, refresh=%d, intl=%d\n",
>> -                       check_timing->xres, check_timing->yres,
>> -                       check_timing->refresh, (check_timing->vmode &
>> -                       FB_VMODE_INTERLACED) ? true : false);
>> -
>> -       for (i = 0; i < ARRAY_SIZE(hdmi_v13_confs); ++i)
>> -               if (hdmi_v13_confs[i].width == check_timing->xres &&
>> -                       hdmi_v13_confs[i].height == check_timing->yres &&
>> -                       hdmi_v13_confs[i].vrefresh == check_timing->refresh &&
>> -                       hdmi_v13_confs[i].interlace ==
>> -                       ((check_timing->vmode & FB_VMODE_INTERLACED) ?
>> -                        true : false))
>> -                               return 0;
>> -
>> -       /* TODO */
>> +       const struct hdmiphy_config *confs;
>> +       int count, i;
>>
>> -       return -EINVAL;
>> -}
>> +       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>
>> -static int hdmi_v14_find_phy_conf(int pixel_clock)
>> -{
>> -       int i;
>> +       if (hdata->type == HDMI_TYPE13) {
>> +               confs = hdmiphy_v13_configs;
>> +               count = ARRAY_SIZE(hdmiphy_v13_configs);
>> +       } else if (hdata->type == HDMI_TYPE14) {
>> +               confs = hdmiphy_v14_configs;
>> +               count = ARRAY_SIZE(hdmiphy_v14_configs);
>> +       } else
>> +               return -EINVAL;
>>
>> -       for (i = 0; i < ARRAY_SIZE(hdmiphy_v14_configs); i++) {
>> -               if (hdmiphy_v14_configs[i].pixel_clock == pixel_clock)
>> +       for (i = 0; i < count; i++)
>> +               if (confs[i].pixel_clock == pixel_clock)
>>                         return i;
>> -       }
>>
>>         DRM_DEBUG_KMS("Could not find phy config for %d\n", pixel_clock);
>>         return -EINVAL;
>>  }
>>
>> -static int hdmi_v14_check_timing(struct fb_videomode *check_timing)
>> -{
>> -       int i;
>> -
>> -       DRM_DEBUG_KMS("mode: xres=%d, yres=%d, refresh=%d, clock=%d, intl=%d\n",
>> -                       check_timing->xres, check_timing->yres,
>> -                       check_timing->refresh, check_timing->pixclock,
>> -                       (check_timing->vmode & FB_VMODE_INTERLACED) ?
>> -                       true : false);
>> -
>> -       for (i = 0; i < ARRAY_SIZE(hdmiphy_v14_configs); i++)
>> -               if (hdmiphy_v14_configs[i].pixel_clock ==
>> -                       check_timing->pixclock)
>> -                       return 0;
>> -
>> -       return -EINVAL;
>> -}
>> -
>>  static int hdmi_check_timing(void *ctx, struct fb_videomode *timing)
>>  {
>>         struct hdmi_context *hdata = ctx;
>> +       int ret;
>>
>>         DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>>
>> @@ -1066,10 +809,10 @@ static int hdmi_check_timing(void *ctx, struct fb_videomode *timing)
>>                         timing->yres, timing->refresh,
>>                         timing->vmode);
>>
>> -       if (hdata->type == HDMI_TYPE13)
>> -               return hdmi_v13_check_timing(timing);
>> -       else
>> -               return hdmi_v14_check_timing(timing);
>> +       ret = hdmi_find_phy_conf(hdata, timing->pixclock);
>> +       if (ret < 0)
>> +               return ret;
>> +       return 0;
>>  }
>>
>>  static void hdmi_set_acr(u32 freq, u8 *acr)
>> @@ -1303,10 +1046,9 @@ static void hdmi_conf_init(struct hdmi_context *hdata)
>>
>>  static void hdmi_v13_timing_apply(struct hdmi_context *hdata)
>>  {
>> -       const struct hdmi_v13_preset_conf *conf =
>> -               hdmi_v13_confs[hdata->cur_conf].conf;
>> -       const struct hdmi_v13_core_regs *core = &conf->core;
>> -       const struct hdmi_v13_tg_regs *tg = &conf->tg;
>> +       const struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v13_conf.tg;
>> +       const struct hdmi_v13_core_regs *core =
>> +               &hdata->mode_conf.conf.v13_conf.core;
>>         int tries;
>>
>>         /* setting core registers */
>> @@ -1336,34 +1078,34 @@ static void hdmi_v13_timing_apply(struct hdmi_context *hdata)
>>         hdmi_reg_writeb(hdata, HDMI_V13_V_SYNC_GEN_3_1, core->v_sync_gen3[1]);
>>         hdmi_reg_writeb(hdata, HDMI_V13_V_SYNC_GEN_3_2, core->v_sync_gen3[2]);
>>         /* Timing generator registers */
>> -       hdmi_reg_writeb(hdata, HDMI_TG_H_FSZ_L, tg->h_fsz_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_H_FSZ_H, tg->h_fsz_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_HACT_ST_L, tg->hact_st_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_HACT_ST_H, tg->hact_st_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_HACT_SZ_L, tg->hact_sz_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_HACT_SZ_H, tg->hact_sz_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_V_FSZ_L, tg->v_fsz_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_V_FSZ_H, tg->v_fsz_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_L, tg->vsync_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_H, tg->vsync_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC2_L, tg->vsync2_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC2_H, tg->vsync2_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST_L, tg->vact_st_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST_H, tg->vact_st_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VACT_SZ_L, tg->vact_sz_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VACT_SZ_H, tg->vact_sz_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_FIELD_CHG_L, tg->field_chg_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_FIELD_CHG_H, tg->field_chg_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST2_L, tg->vact_st2_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST2_H, tg->vact_st2_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_TOP_HDMI_L, tg->vsync_top_hdmi_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_TOP_HDMI_H, tg->vsync_top_hdmi_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_BOT_HDMI_L, tg->vsync_bot_hdmi_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_BOT_HDMI_H, tg->vsync_bot_hdmi_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_FIELD_TOP_HDMI_L, tg->field_top_hdmi_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_FIELD_TOP_HDMI_H, tg->field_top_hdmi_h);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_FIELD_BOT_HDMI_L, tg->field_bot_hdmi_l);
>> -       hdmi_reg_writeb(hdata, HDMI_TG_FIELD_BOT_HDMI_H, tg->field_bot_hdmi_h);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_H_FSZ_L, tg->h_fsz[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_H_FSZ_H, tg->h_fsz[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_HACT_ST_L, tg->hact_st[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_HACT_ST_H, tg->hact_st[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_HACT_SZ_L, tg->hact_sz[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_HACT_SZ_H, tg->hact_sz[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_V_FSZ_L, tg->v_fsz[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_V_FSZ_H, tg->v_fsz[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_L, tg->vsync[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_H, tg->vsync[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC2_L, tg->vsync2[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC2_H, tg->vsync2[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST_L, tg->vact_st[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST_H, tg->vact_st[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VACT_SZ_L, tg->vact_sz[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VACT_SZ_H, tg->vact_sz[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_FIELD_CHG_L, tg->field_chg[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_FIELD_CHG_H, tg->field_chg[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST2_L, tg->vact_st2[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VACT_ST2_H, tg->vact_st2[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_TOP_HDMI_L, tg->vsync_top_hdmi[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_TOP_HDMI_H, tg->vsync_top_hdmi[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_BOT_HDMI_L, tg->vsync_bot_hdmi[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_VSYNC_BOT_HDMI_H, tg->vsync_bot_hdmi[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_FIELD_TOP_HDMI_L, tg->field_top_hdmi[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_FIELD_TOP_HDMI_H, tg->field_top_hdmi[1]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_FIELD_BOT_HDMI_L, tg->field_bot_hdmi[0]);
>> +       hdmi_reg_writeb(hdata, HDMI_TG_FIELD_BOT_HDMI_H, tg->field_bot_hdmi[1]);
>>
>>         /* waiting for HDMIPHY's PLL to get to steady state */
>>         for (tries = 100; tries; --tries) {
>> @@ -1393,8 +1135,9 @@ static void hdmi_v13_timing_apply(struct hdmi_context *hdata)
>>
>>  static void hdmi_v14_timing_apply(struct hdmi_context *hdata)
>>  {
>> -       struct hdmi_core_regs *core = &hdata->mode_conf.core;
>> -       struct hdmi_tg_regs *tg = &hdata->mode_conf.tg;
>> +       const struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v14_conf.tg;
>> +       const struct hdmi_v14_core_regs *core =
>> +               &hdata->mode_conf.conf.v14_conf.core;
>>         int tries;
>>
>>         /* setting core registers */
>> @@ -1626,15 +1369,15 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
>>         }
>>
>>         /* pixel clock */
>> +       i = hdmi_find_phy_conf(hdata, hdata->mode_conf.pixel_clock);
>> +       if (i < 0) {
>> +               DRM_ERROR("failed to find hdmiphy conf\n");
>> +               return;
>> +       }
>> +
>>         if (hdata->type == HDMI_TYPE13) {
>> -               hdmiphy_data = hdmi_v13_confs[hdata->cur_conf].hdmiphy_data;
>> +               hdmiphy_data = hdmiphy_v13_configs[i].conf;
>>         } else {
>> -               i = hdmi_v14_find_phy_conf(hdata->mode_conf.pixel_clock);
>> -               if (i < 0) {
>> -                       DRM_ERROR("failed to find hdmiphy conf\n");
>> -                       return;
>> -               }
>> -
>>                 hdmiphy_data = hdmiphy_v14_configs[i].conf;
>>         }
>>
>> @@ -1701,10 +1444,7 @@ static void hdmi_mode_fixup(void *ctx, struct drm_connector *connector,
>>
>>         drm_mode_set_crtcinfo(adjusted_mode, 0);
>>
>> -       if (hdata->type == HDMI_TYPE13)
>> -               index = hdmi_v13_conf_index(adjusted_mode);
>> -       else
>> -               index = hdmi_v14_find_phy_conf(adjusted_mode->clock * 1000);
>> +       index = hdmi_find_phy_conf(hdata, adjusted_mode->clock * 1000);
>>
>>         /* just return if user desired mode exists. */
>>         if (index >= 0)
>> @@ -1715,10 +1455,7 @@ static void hdmi_mode_fixup(void *ctx, struct drm_connector *connector,
>>          * to adjusted_mode.
>>          */
>>         list_for_each_entry(m, &connector->modes, head) {
>> -               if (hdata->type == HDMI_TYPE13)
>> -                       index = hdmi_v13_conf_index(m);
>> -               else
>> -                       index = hdmi_v14_find_phy_conf(m->clock * 1000);
>> +               index = hdmi_find_phy_conf(hdata, m->clock * 1000);
>>
>>                 if (index >= 0) {
>>                         struct drm_mode_object base;
>> @@ -1749,15 +1486,113 @@ static void hdmi_set_reg(u8 *reg_pair, int num_bytes, u32 value)
>>                 reg_pair[i] = (value >> (8 * i)) & 0xff;
>>  }
>>
>> -static void hdmi_v14_mode_set(struct hdmi_context *hdata,
>> +static void hdmi_v13_mode_set(struct hdmi_context *hdata,
>>                         struct drm_display_mode *m)
>>  {
>> -       struct hdmi_core_regs *core = &hdata->mode_conf.core;
>> -       struct hdmi_tg_regs *tg = &hdata->mode_conf.tg;
>> +       struct hdmi_v13_core_regs *core = &hdata->mode_conf.conf.v13_conf.core;
>> +       struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v13_conf.tg;
>> +       unsigned int val;
>>
>> -       hdata->mode_conf.cea_video_id = drm_match_cea_mode(m);
>> +       hdata->mode_conf.cea_video_id =
>> +               drm_match_cea_mode((struct drm_display_mode *)m);
>> +       hdata->mode_conf.pixel_clock = m->clock * 1000;
>> +
>> +       hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
>> +       hdmi_set_reg(core->h_v_line, 3, (m->htotal << 12) | m->vtotal);
>> +
>> +       val = (m->flags & DRM_MODE_FLAG_NVSYNC) ? 1 : 0;
>> +       hdmi_set_reg(core->vsync_pol, 1, val);
>> +
>> +       val = (m->flags & DRM_MODE_FLAG_INTERLACE) ? 1 : 0;
>> +       hdmi_set_reg(core->int_pro_mode, 1, val);
>> +
>> +       val = (m->hsync_start - m->hdisplay - 2);
>> +       val |= ((m->hsync_end - m->hdisplay - 2) << 10);
>> +       val |= ((m->flags & DRM_MODE_FLAG_NHSYNC)  ? 1 : 0)<<20;
>> +       hdmi_set_reg(core->h_sync_gen, 3, val);
>> +
>> +       /*
>> +        * Quirk requirement for exynos HDMI IP design,
>> +        * 2 pixels less than the actual calculation for hsync_start
>> +        * and end.
>> +        */
>> +
>> +       /* Following values & calculations differ for different type of modes */
>> +       if (m->flags & DRM_MODE_FLAG_INTERLACE) {
>> +               /* Interlaced Mode */
>> +               val = ((m->vsync_end - m->vdisplay) / 2);
>> +               val |= ((m->vsync_start - m->vdisplay) / 2) << 12;
>> +               hdmi_set_reg(core->v_sync_gen1, 3, val);
>> +
>> +               val = m->vtotal / 2;
>> +               val |= ((m->vtotal - m->vdisplay) / 2) << 11;
>> +               hdmi_set_reg(core->v_blank, 3, val);
>> +
>> +               val = (m->vtotal +
>> +                       ((m->vsync_end - m->vsync_start) * 4) + 5) / 2;
>> +               val |= m->vtotal << 11;
>> +               hdmi_set_reg(core->v_blank_f, 3, val);
>> +
>> +               val = ((m->vtotal / 2) + 7);
>> +               val |= ((m->vtotal / 2) + 2) << 12;
>> +               hdmi_set_reg(core->v_sync_gen2, 3, val);
>> +
>> +               val = ((m->htotal / 2) + (m->hsync_start - m->hdisplay));
>> +               val |= ((m->htotal / 2) +
>> +                       (m->hsync_start - m->hdisplay)) << 12;
>> +               hdmi_set_reg(core->v_sync_gen3, 3, val);
>> +
>> +               hdmi_set_reg(tg->vact_st, 2, (m->vtotal - m->vdisplay) / 2);
>> +               hdmi_set_reg(tg->vact_sz, 2, m->vdisplay / 2);
>> +
>> +               hdmi_set_reg(tg->vact_st2, 2, 0x249);/* Reset value + 1*/
>> +       } else {
>> +               /* Progressive Mode */
>> +
>> +               val = m->vtotal;
>> +               val |= (m->vtotal - m->vdisplay) << 11;
>> +               hdmi_set_reg(core->v_blank, 3, val);
>> +
>> +               hdmi_set_reg(core->v_blank_f, 3, 0);
>>
>> +               val = (m->vsync_end - m->vdisplay);
>> +               val |= ((m->vsync_start - m->vdisplay) << 12);
>> +               hdmi_set_reg(core->v_sync_gen1, 3, val);
>> +
>> +               hdmi_set_reg(core->v_sync_gen2, 3, 0x1001);/* Reset value  */
>> +               hdmi_set_reg(core->v_sync_gen3, 3, 0x1001);/* Reset value  */
>> +               hdmi_set_reg(tg->vact_st, 2, m->vtotal - m->vdisplay);
>> +               hdmi_set_reg(tg->vact_sz, 2, m->vdisplay);
>> +               hdmi_set_reg(tg->vact_st2, 2, 0x248); /* Reset value */
>> +       }
>> +
>> +       /* Timing generator registers */
>> +       hdmi_set_reg(tg->cmd, 1, 0x0);
>> +       hdmi_set_reg(tg->h_fsz, 2, m->htotal);
>> +       hdmi_set_reg(tg->hact_st, 2, m->htotal - m->hdisplay);
>> +       hdmi_set_reg(tg->hact_sz, 2, m->hdisplay);
>> +       hdmi_set_reg(tg->v_fsz, 2, m->vtotal);
>> +       hdmi_set_reg(tg->vsync, 2, 0x1);
>> +       hdmi_set_reg(tg->vsync2, 2, 0x233); /* Reset value */
>> +       hdmi_set_reg(tg->field_chg, 2, 0x233); /* Reset value */
>> +       hdmi_set_reg(tg->vsync_top_hdmi, 2, 0x1); /* Reset value */
>> +       hdmi_set_reg(tg->vsync_bot_hdmi, 2, 0x233); /* Reset value */
>> +       hdmi_set_reg(tg->field_top_hdmi, 2, 0x1); /* Reset value */
>> +       hdmi_set_reg(tg->field_bot_hdmi, 2, 0x233); /* Reset value */
>> +       hdmi_set_reg(tg->tg_3d, 1, 0x0); /* Not used */
>> +}
>> +
>> +static void hdmi_v14_mode_set(struct hdmi_context *hdata,
>> +                       struct drm_display_mode *m)
>> +{
>> +       struct hdmi_tg_regs *tg = &hdata->mode_conf.conf.v14_conf.tg;
>> +       struct hdmi_v14_core_regs *core =
>> +               &hdata->mode_conf.conf.v14_conf.core;
>> +
>> +       hdata->mode_conf.cea_video_id =
>> +               drm_match_cea_mode((struct drm_display_mode *)m);
>>         hdata->mode_conf.pixel_clock = m->clock * 1000;
>> +
>>         hdmi_set_reg(core->h_blank, 2, m->htotal - m->hdisplay);
>>         hdmi_set_reg(core->v_line, 2, m->vtotal);
>>         hdmi_set_reg(core->h_line, 2, m->htotal);
>> @@ -1854,22 +1689,20 @@ static void hdmi_v14_mode_set(struct hdmi_context *hdata,
>>         hdmi_set_reg(tg->field_top_hdmi, 2, 0x1); /* Reset value */
>>         hdmi_set_reg(tg->field_bot_hdmi, 2, 0x233); /* Reset value */
>>         hdmi_set_reg(tg->tg_3d, 1, 0x0);
>> -
>>  }
>>
>>  static void hdmi_mode_set(void *ctx, void *mode)
>>  {
>>         struct hdmi_context *hdata = ctx;
>> -       int conf_idx;
>> +       struct drm_display_mode *m = mode;
>>
>> -       DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
>> +       DRM_DEBUG_KMS("[%s]: xres=%d, yres=%d, refresh=%d, intl=%s\n",
>> +               __func__, m->hdisplay, m->vdisplay,
>> +               m->vrefresh, (m->flags & DRM_MODE_FLAG_INTERLACE) ?
>> +               "INTERLACED" : "PROGERESSIVE");
>>
>>         if (hdata->type == HDMI_TYPE13) {
>> -               conf_idx = hdmi_v13_conf_index(mode);
>> -               if (conf_idx >= 0)
>> -                       hdata->cur_conf = conf_idx;
>> -               else
>> -                       DRM_DEBUG_KMS("not supported mode\n");
>> +               hdmi_v13_mode_set(hdata, mode);
>>         } else {
>>                 hdmi_v14_mode_set(hdata, mode);
>>         }
>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>> index 6404f7e4..961ca0e 100644
>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>> @@ -813,7 +813,6 @@ static void mixer_win_disable(void *ctx, int win)
>>
>>  int mixer_check_timing(void *ctx, struct fb_videomode *timing)
>>  {
>> -       struct mixer_context *mixer_ctx = ctx;
>>         u32 w, h;
>>
>>         w = timing->xres;
>> @@ -824,9 +823,6 @@ int mixer_check_timing(void *ctx, struct fb_videomode *timing)
>>                 timing->refresh, (timing->vmode &
>>                 FB_VMODE_INTERLACED) ? true : false);
>>
>> -       if (mixer_ctx->mxr_ver == MXR_VER_0_0_0_16)
>> -               return 0;
>> -
>>         if ((w >= 464 && w <= 720 && h >= 261 && h <= 576) ||
>>                 (w >= 1024 && w <= 1280 && h >= 576 && h <= 720) ||
>>                 (w >= 1664 && w <= 1920 && h >= 936 && h <= 1080))
>> --
>> 1.8.0
>>
