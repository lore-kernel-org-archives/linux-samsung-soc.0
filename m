From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/5] dt-bindings: document the s3c24xx software-reset
 register
Date: Thu, 23 Jan 2014 19:09:22 +0100
Message-ID: <52E15AD2.7000602@samsung.com>
References: <3105326.uFdOVLyXH8@phil> <2635551.Gy9A9uhyAA@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:17836 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753675AbaAWSJj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jan 2014 13:09:39 -0500
In-reply-to: <2635551.Gy9A9uhyAA@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org

Hi Heiko,

On 06.01.2014 19:37, Heiko St=FCbner wrote:
> The S3C2412/S3C2413 as well as the S3C2443 and following contain a sp=
ecial
> register that restarts the system when written to. This adds a simple
> binding, so that it gets accessible on dt systems too.
>
> We distinguish between the two types (s3c2412, s3c2443) because the
> handling of the swrst register on the s3c2412 also needs to take care
> of a hardware glitch at reset time.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   .../devicetree/bindings/arm/samsung/s3c24xx-swrst.txt  |   16 +++++=
+++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/samsung/s3=
c24xx-swrst.txt

Is there really a need to have separate bindings for this?

As far as I can see, the swreset register is a part of the clock=20
controller, so restart function could be provided by clock driver and=20
there would be no need to change anything in DT.

Best regards,
Tomasz
