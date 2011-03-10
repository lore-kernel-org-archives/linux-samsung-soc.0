From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [PATCH] SAMSUNG: S5PV310: Add I2S playback support
Date: Thu, 10 Mar 2011 19:08:54 +0900
Message-ID: <AANLkTikoUUJmp6=PnumaCF8JD6pec9KZj_dFbOu66Smo@mail.gmail.com>
References: <1299580852-20959-1-git-send-email-giridhar.maruthy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:41282 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751116Ab1CJKIz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 05:08:55 -0500
Received: by wya21 with SMTP id 21so1288257wya.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Mar 2011 02:08:54 -0800 (PST)
In-Reply-To: <1299580852-20959-1-git-send-email-giridhar.maruthy@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi,

On Tue, Mar 8, 2011 at 7:40 PM, Giridhar Maruthy
<giridhar.maruthy@linaro.org> wrote:
> This commit adds the platform device and data of
> wm8994 regulator to enable the I2S playback on
> S5PV310 board on linux-linaro-2.6.38.
>
> Signed-off-by: Giridhar Maruthy <giridhar.maruthy@linaro.org>
> ---
> =C2=A0arch/arm/mach-exynos4/mach-smdkv310.c | =C2=A0167 +++++++++++++=
+++++++++++++++++++-
> =C2=A01 files changed, 166 insertions(+), 1 deletions(-)
>

I'm so sad about this patch is pretty much same as my previous patch,
"ARM: SMDKC210: Add regulator settings for WM8994
audio"(http://git.kernel.org/?p=3Dlinux/kernel/git/kki_ap/linux-2.6-sam=
sung.git;a=3Dcommitdiff;h=3D1307c0dac85bc5e5f26de4f615040a2b06eb64ac),
and there is no comment about this source comes from in your patch.
But, I think that you just _forgot_ to write this comment and you will
add it into your re-worked patch. ;)

Thanks,
Claude.
