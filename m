From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 1/3] include: fb: Add definiton for window positioning structure
Date: Tue, 20 Sep 2011 20:16:00 +0530
Message-ID: <CAEC9eQOTNaMcUWeSFN-DCTYrCJsVaDAO7uOZNQM=efjVdqtU2g@mail.gmail.com>
References: <1316532641-2657-1-git-send-email-ajaykumar.rs@samsung.com>
	<1316532641-2657-2-git-send-email-ajaykumar.rs@samsung.com>
	<1316517021.1949.13.camel@deskari>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:41306 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750811Ab1ITOqD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Sep 2011 10:46:03 -0400
In-Reply-To: <1316517021.1949.13.camel@deskari>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lethal@linux-sh.org, jg1.han@samsung.com, m.szyprowski@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org, banajit.g@samsung.com

Hi Tomi,

On Tue, Sep 20, 2011 at 4:40 PM, Tomi Valkeinen <tomi.valkeinen@ti.com>=
 wrote:
> On Tue, 2011-09-20 at 11:30 -0400, Ajay Kumar wrote:
>> This patch adds a data structure definiton to hold framebuffer windo=
ws/planes.
>> An ioctl number is also added to provide user access
>> to change window position dynamically.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
>> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> =A0include/linux/fb.h | =A0 =A07 +++++++
>> =A01 files changed, 7 insertions(+), 0 deletions(-)
>>
>> diff --git a/include/linux/fb.h b/include/linux/fb.h
>> index 1d6836c..2141941 100644
>> --- a/include/linux/fb.h
>> +++ b/include/linux/fb.h
>> @@ -39,6 +39,7 @@
>> =A0#define FBIOPUT_MODEINFO =A0 =A0 =A0 =A00x4617
>> =A0#define FBIOGET_DISPINFO =A0 =A0 =A0 =A00x4618
>> =A0#define FBIO_WAITFORVSYNC =A0 =A0_IOW('F', 0x20, __u32)
>> +#define FBIOPOS_OVERLAY_WIN =A0_IOW('F', 0x21, struct fb_overlay_wi=
n_pos)
>>
>> =A0#define FB_TYPE_PACKED_PIXELS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00 =A0=
 =A0 =A0 /* Packed Pixels =A0 =A0 =A0 =A0*/
>> =A0#define FB_TYPE_PLANES =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 1 =A0 =A0 =A0 /* Non interleaved planes */
>> @@ -366,6 +367,12 @@ struct fb_image {
>> =A0 =A0 =A0 struct fb_cmap cmap; =A0 =A0/* color map info */
>> =A0};
>>
>> +/* Window overlaying */
>> +struct fb_overlay_win_pos {
>> + =A0 =A0 __u32 win_pos_x; =A0 =A0 =A0 =A0/* x-offset from LCD(0,0) =
where window starts */
>> + =A0 =A0 __u32 win_pos_y; =A0 =A0 =A0 =A0/* y-offset from LCD(0,0) =
where window starts */
>> +};
>
> Shouldn't this also include the window size (in case scaling is
> supported)?

The "xres" and "yres" fields in fb_var_screeninfo are being used to
represent the size of the window (visible resolution). So we have,

win_pos_x: x-offset from LCD(0,0) where window starts.
win_pos_y: y-offset from LCD(0,0) where window starts.
(win_pos_x + xres) : x-offset from LCD(0,0) where window ends.
(win_pos_y + yres) : y-offset from LCD(0,0) where window ends.

> This also won't work for setups where the same framebuffer is used by
> multiple overlays. For example, this is the case on OMAP when the sam=
e
> content is cloned to, say, LCD and TV, each of which is showing an
> overlay.

These x and y position are used to configure the display controller
(for LCD only) and not to alter the data in physical buffer
(framebuffer). Could you elaborate the above use case you have
mentioned and how adding the x and y offsets would not meet that
requirement.

> =A0Tomi
>

Ajay
