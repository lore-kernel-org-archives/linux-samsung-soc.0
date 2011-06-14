From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 0/4] s3c-fb: Add support S5PV310 FIMD
Date: Tue, 14 Jun 2011 11:44:42 +0900
Message-ID: <BANLkTikZKNivSigMgjVe=2=zZRrOhVPjCQ@mail.gmail.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
	<4DF35D60.5090502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:50597 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751520Ab1FNCon convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2011 22:44:43 -0400
Received: by vxi39 with SMTP id 39so4125109vxi.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2011 19:44:42 -0700 (PDT)
In-Reply-To: <4DF35D60.5090502@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>, Joonyoung Shim <jy0922.shim@samsung.com>, =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>
Cc: Anand Kumar N <anand.kn@samsung.com>, lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

CCed Display developers from other Samsung open source team

On Sat, Jun 11, 2011 at 9:19 PM, Sylwester Nawrocki <snjw23@gmail.com> =
wrote:
> Hi Anand,
>
> On 06/10/2011 10:15 AM, Anand Kumar N wrote:
>> This patch series is based on the latest
>> git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-=
next
>>
>> This was originally submitted by Jonghun Han<jonghun.han@samsung.com=
>
>> http://www.spinics.net/lists/arm-kernel/msg101781.html
>> This patchset has been not picked up in the mainline due to the unav=
ailibility
>> of cldev lookup. So it is being re-submitted rebased to 3.0.0-rc1 an=
d tested
>> over the clkdev patches.
>
> As far as I can see there is no functional changes in these patches c=
omparing
> to the original ones. AFAIR the idea with clkdev was to create clock =
to device
> mapping for each SoC variant and have driver using unified clock name=
s across
> SoC variants. There is nothing close to that in your following patche=
s.
>
> Moreover looking at the S5PC110 datasheet only, the list of possible =
sclk_fimd
> parent clocks is specified as "All possible clock sources". It exactl=
y means:
> XXTI, XusbXTI, SCLK_HDMI_27M, SCLK_USBPHY_0, SCLK_USBPHY_1, SCLK_HDMI=
PHY,
> SCLK_M_PLL, SCLK_E_PLL, SCLK_V_PLL. So quite many, whereas you are tr=
ying
> to forcibly use in the driver SCLK_M_PLL only. As it has been pointed=
 out
> setting FIMD clock parent should be moved away to board code/DT/bootl=
oader,
> which allows to use the driver in unchanged form in various system
> configurations. Let the board designer to make decisions about the cl=
ock
> configurations.
>
> --
> Regards,
> Sylwester
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
