From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: Enable EC vboot context support on Peach
 boards
Date: Tue, 15 Sep 2015 09:00:42 +0900
Message-ID: <55F75FAA.9000007@samsung.com>
References: <1442234049-18637-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1442234049-18637-4-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25140 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751595AbbIOAAu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Sep 2015 20:00:50 -0400
In-reply-to: <1442234049-18637-4-git-send-email-emilio.lopez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio.lopez@collabora.co.uk>, gregkh@linuxfoundation.org, olof@lixom.net, kgene@kernel.org, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 14.09.2015 21:34, Emilio L=C3=B3pez wrote:
> The Peach boards use the EC to store the vboot context information,
> so add the corresponding properties on the EC node to indicate so.
>=20
> Signed-off-by: Emilio L=C3=B3pez <emilio.lopez@collabora.co.uk>
> ---
>=20
> Changes from v1:
>  - none
>=20
>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 1 +
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
