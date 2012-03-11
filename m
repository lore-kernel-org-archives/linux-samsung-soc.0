From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung board stuff for v3.4
Date: Sun, 11 Mar 2012 00:02:30 -0800
Message-ID: <4F5C5C16.6020106@samsung.com>
References: <4F5B748B.6050404@samsung.com> <CAOesGMjiYDFhkjS=2e+3YdPJHExupt3Wm_NS3x1XW-17eEZM=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:63192 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751040Ab2CKICe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Mar 2012 04:02:34 -0400
Received: by iagz16 with SMTP id z16so4974194iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Mar 2012 00:02:34 -0800 (PST)
In-Reply-To: <CAOesGMjiYDFhkjS=2e+3YdPJHExupt3Wm_NS3x1XW-17eEZM=A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 03/10/12 09:45, Olof Johansson wrote:
> Hi,
>
> On Sat, Mar 10, 2012 at 7:34 AM, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>> Hi Arnd, Olof,
>>
>> Please pull regarding Samsung board patches for v3.4.
>>
>> Most are enabling some features(IPs) on each board and
>> one is adding new board file, Samsung Mobile's TRATS board.
>
> Given that exynos has started conversion to device tree, there should
> not be any  additions of non-devicetree-probed board files being
> added.
>
> At the very least, you should move over to using DT_MACHINE instead of
> MACHINE for the new board, and probe using device tree. Even better
> would be if you added support for this board through mach-exynos4-dt.c
> instead of adding a brand new board file.
>
> I also see a large number of the same additions of devices, done to a
> number of board files. I don't think you need to rework those patches
> now, but please consider how you can make it less "churny" to add a
> device on the SoC in the future without touching all board files.
>
>
> If you rebase without the board file addition I can take the rest of
> the branch while that part is being reworked. Please send a new pull
> request with the rebased tree.
>
OK, I see. let me send a new pull request soon as per your suggestion.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
