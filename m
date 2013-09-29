From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to hdmiphy
 driver
Date: Mon, 30 Sep 2013 00:08:46 +0200
Message-ID: <5248A4EE.9000708@gmail.com>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com> <011901cea941$91853e40$b48fbac0$%dae@samsung.com> <CAOw6vb+32WsEY0px-iZaSv-AYj9NS6OX9hqpH-y6VQ77SpHymw@mail.gmail.com> <00bf01cea9ee$bcda5960$368f0c20$%dae@samsung.com> <CAPdUM4PT4cpXSe6sLgFaQnsycgY9AvYXPtgTMywYT0oePwPWwA@mail.gmail.com> <00ca01cea9f7$f5ee3b50$e1cab1f0$%dae@samsung.com> <CAPdUM4MxLBoiE6DpUbkn2-Sji89RM1+yHeAS1c2OREB+=BfdVg@mail.gmail.com> <00cf01cea9ff$dc9749a0$95c5dce0$%dae@samsung.com> <CAOw6vbLAuJyFU55wP1+Akm6PZepxaS_UuwFYe9LWcM3sKFmWwA@mail.gmail.com> <011601ceaa3e$d08e8b20$71aba160$%dae@samsung.com> <CAPdUM4OoicU76Tw-gkuvAGGvOHM-x1DfYLUEFKa3KaEAtwLAvw@mail.gmail.com> <CAOw6vbLrgigGHdwGQHRWJAF=N-ZaL+6VSyUfP37B-4baU-+jBQ@mail.gmail.com> <CAPdUM4PpFbc9utAsHnqyF9OJdipdgq036fqFM_SeG0O+M3N5jA@mail.gmail
 .com> <037401ceb2d9$ea596ea0$bf0c4be0$%dae@samsung.com> <CAPdUM4P0mecAGe++QELW_B7KOpABUSFvFTgCddowCM8cqtVvFA@mail.gmail.com> <CAAQKjZPtxLAJOz6573+hEPZokEnvGF8BTMXoxcYUQ8zySAn-OA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAQKjZPtxLAJOz6573+hEPZokEnvGF8BTMXoxcYUQ8zySAn-OA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rahul Sharma <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "sw0312.kim" <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "kgene.kim" <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shirish S <shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 09/28/2013 06:10 PM, Inki Dae wrote:
>> Any opinion from Device-Tree folks?
>>
>> IMO, we should have same consensus on Shirish patches before proceeding.
>
> Rahul, it seems that DT people have no interest in this issue. So let's
> have a consensus about this issue internally.
>
> To Mr. Kyungmin, Sylwester, Kukjin Kim, and Tomasz,
> How about keeping hdmiphy config data in each board dts file?

Please don't use HTML and quote only relevant part of e-mails. Otherwise
there are good chances your messages end up in people's spam box.

It often helps to Cc a DT binding maintainer directly.

Then, you consider moving the HDMI phy configuration to the device tree.
As Sean suggested in this thread:

">> +static struct hdmiphy_config hdmiphy_4210_configs[] = {
>> +       {
>> +               .pixel_clock = 27000000,
>> +               .conf = {
>> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30, 0x40,
>> +                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54, 0x87,
>> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10, 0xE0,
>> +                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00, 0x00,
>> +               },
>> +       },
[trimmed couple more entries]
>> +};
>>
> Are you aware of the effort to move these to dt? Since these are
> board-specific values, it seems incorrect to apply them universally.
> Shirish has uploaded a patch to the chromium review site to push these
> into dt (https://chromium-review.googlesource.com/#/c/65581). Maybe
> you can work that into your patch set?"

The configuration data is 64 bytes of the register values IIUC. Would it be
possible to figure out exact meaning of each byte ? Do all of these bytes
need to be changed per board ? Perhaps we can have per SoC static tables in
the PHY driver and be overwriting only some of the bytes with values read
from device tree ?

AFAIR firmware-like binary blobs (register address/value pairs) are not
supposed to be stored in DT.

If there is no detailed documentation for theese PHY configuration tables
I guess there is no choice but to put these raw 64 bytes in DT. Presumably
this should be a an required property defined only by board dts, since those
values are PCB design dependent.

However, if not all boards need tweaking this configuration data, then it
could make sense to define recommended per-SoC tables in the driver and
overwrite from DT only if it is specified there for a specific board.
If we can come up with universal configuration for a SoC and selected pixel
clock frequency then it could likely be better to store that in the driver
rather than in DT.

--
Thanks,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
