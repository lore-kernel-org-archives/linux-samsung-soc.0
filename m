From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RESEND] [PATCH 1/1] ARM: dts: Add LEDs on odroid XU3 board
Date: Fri, 08 May 2015 16:52:08 +0900
Message-ID: <554C6B28.7000306@samsung.com>
References: <554C66F4.4070005@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:57225 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751424AbbEHHwL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 03:52:11 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NO000GFGTUXXJ50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 May 2015 08:52:09 +0100 (BST)
In-reply-to: <554C66F4.4070005@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: m.reichl@fivetechno.de, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08.05.2015 16:34, Markus Reichl wrote:
> This patch adds the RGB-LED on XU3 as 3 gpio-leds.
> 
> Tested-by: Anand Moon <linux.amoon@gmail.com>

Unfortunately I could not found on LKML email from Anand that he
tested it. You sent the patch first time on 2nd of April - without
Anand's tested-by. On 13th of April it appeared with his tag.

Guys, even when you work closely please send all tags publicly on LKML
so everyone could see them.

Anand, do you confirm the tested-by?

> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de> --- It is
> derived from hardkernel's 3.10 tree.

Hmmm... Whose original code it was? Shouldn't there be someone else
Signed-off-by here?

Best regards,
Krzysztof
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVTGsoAAoJEME3ZuaGi4PXbPAP/jDFtVian19v6L1MsnPYGJtk
xD+V+JhpgcDWRaxTIBlS3xdcrTO1Ci/+C/b1Me7a1amczvNPEL2iT53d0rSDX+QA
UufqWylu0n/QScthCOn3en0ghGibCoAT2d5hIyeAMPPka66xBrIgkp7ZffOQfpnR
+rNyouireSHm38Mu2utyRPUACiS/KMps1GFZ8uNy+I/JZ1hVjiZulqHItvBSpPh/
Vaya0BupC9D6zNfp3lBjSJBgjuFSe+v2GCqjpcZIiACLs6t31J/jrzo1Sthc24jC
d15SD/H484P3r9yvERLwUMc7s+e8d4f9yFN3X2eIT1mKzrKbPlRZ4jKfmlHi2nO9
4mnfI2S7D6YpLTax997ESPb6KSLkcxstrT6ISham1sz2E3Ge/JbkJGrv4jZbgzot
KVO+I4BHVDHb8J5Rw8c2oUQsyqoEB3qHDVbnCZXsWRL8KLylVse+h01pp3zyuMTW
OmC0zLKY+4I1Webj9DCCaFlA8w3UDnD5AvEd3zU77RkShYop8MIU8ltvTbIOOyvH
NPejZKx0fPHksKEMypWWfF8z7LIMI+tVON2WJ5O4zKg5lh9X0a2MCRlYAAoxM3Gu
iSOEe6c/+CrnsVWlEynfUTshdU0FUxcw5296puQMEX52jQVBWHY8plIgoUdDW2j+
hz9CTaBt5uq46wb+KhOa
=IxJs
-----END PGP SIGNATURE-----
