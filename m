From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 2/2] arm: Add back maximum bank limit
Date: Mon, 30 Jun 2014 00:56:54 +0200
Message-ID: <53B099B6.1070706@suse.de>
References: <1404068784-27604-1-git-send-email-lauraa@codeaurora.org> <1404068784-27604-2-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34443 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753466AbaF2W47 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 29 Jun 2014 18:56:59 -0400
In-Reply-To: <1404068784-27604-2-git-send-email-lauraa@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laura Abbott <lauraa@codeaurora.org>, Tushar Behera <trblinux@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, devicetree@vger.kernel.org

Hi Laura,

Am 29.06.2014 21:06, schrieb Laura Abbott:
> Commit 1c2f87c22566cd057bc8cde10c37ae9da1a1bb76
> (ARM: 8025/1: Get rid of meminfo) dropped the upper bound on
> the number of memory banks that can be added as there was no
> technical need in the kernel. It turns out though, some bootloaders
> (specifically the arndale-octa exynos boards) may pass invalid memory
> information and rely on the kernel to not parse this data. This is a
> bug in the bootloader but we still need to work around this.
> Re-introduce a maximum bank limit per board to prevent invalid banks
> from being passed to the kernel.
>=20
> Reported-by: Tushar Behera <trblinux@gmail.com>
> Signed-off-by: Laura Abbott <lauraa@codeaurora.org>
> ---
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/26561=
5.html

Tested-by: Andreas F=E4rber <afaerber@suse.de>

[    0.000000] Max banks too low, ignoring memory at 0xfbffffaf
[    0.000000] Max banks too low, ignoring memory at 0xfffedbff
[    0.000000] Max banks too low, ignoring memory at 0xffbbffd9
[    0.000000] Max banks too low, ignoring memory at 0xffefefef

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
