From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Tue, 11 Feb 2014 15:39:27 -0800
Message-ID: <CAOesGMiWsWXkQkb-_VZGco0gKNZPsHf3ubR88y4Pt4-umk5_Ww@mail.gmail.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com>
	<1392100183-30930-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:54308 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585AbaBKXj2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 18:39:28 -0500
Received: by mail-qc0-f171.google.com with SMTP id n7so14195720qcx.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2014 15:39:27 -0800 (PST)
In-Reply-To: <1392100183-30930-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>

On Mon, Feb 10, 2014 at 10:29 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> This patch adds support for Samsung GH7 SoC in arm64/Kconfig.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>

The overhead of building one more device tree isn't very large, and I
don't see any other need to have a Kconfig entry per SoC at this time.
It's of course up to Catalin, but you might just want to always
compile all dts files instead.


-Olof
