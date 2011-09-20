From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 1/3] include: fb: Add definiton for window positioning structure
Date: Tue, 20 Sep 2011 20:56:57 +0530
Message-ID: <CAEC9eQOpwfmRfcxHoiA00xX0a=dxXj1xJDpW14DozGXKXPJ3Xg@mail.gmail.com>
References: <1316532641-2657-1-git-send-email-ajaykumar.rs@samsung.com>
	<1316532641-2657-2-git-send-email-ajaykumar.rs@samsung.com>
	<20110920112427.GB19695@sapphire.tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:41861 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750763Ab1ITP07 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Sep 2011 11:26:59 -0400
In-Reply-To: <20110920112427.GB19695@sapphire.tkos.co.il>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, banajit.g@samsung.com, jg1.han@samsung.com, lethal@linux-sh.org, ben-linux@fluff.org, m.szyprowski@samsung.com

Hi Baruch,

On Tue, Sep 20, 2011 at 4:54 PM, Baruch Siach <baruch@tkos.co.il> wrote=
:
> Hi Ajay,
>
> On Tue, Sep 20, 2011 at 11:30:39AM -0400, Ajay Kumar wrote:
>> This patch adds a data structure definiton to hold framebuffer windo=
ws/planes.
>> An ioctl number is also added to provide user access
>> to change window position dynamically.
>
> [snip]
>
>> +/* Window overlaying */
>> +struct fb_overlay_win_pos {
>> + =A0 =A0 __u32 win_pos_x; =A0 =A0 =A0 =A0/* x-offset from LCD(0,0) =
where window starts */
>> + =A0 =A0 __u32 win_pos_y; =A0 =A0 =A0 =A0/* y-offset from LCD(0,0) =
where window starts */
>> +};
>
> Why not allow negative offsets where the left or upper part of the fr=
amebuffer
> is hidden?

Thanks for pointing it out. Are there drivers which place the overlay
windows such that some part of the window is hidden from being
displayed on the screen?

> baruch
>
> --
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ~. .~ =A0 Tk Open Systems
> =3D}------------------------------------------------ooO--U--Ooo------=
------{=3D
> =A0 - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il=
 -
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fbdev=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Ajay
