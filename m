From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/3] mfd: use to_i2c_client
Date: Tue, 29 Dec 2015 09:29:22 +0900
Message-ID: <5681D3E2.4000602@samsung.com>
References: <0837727b57d573988a47f3ecb22918e9771e8dbe.1451314502.git.geliangtang@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58314 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751257AbbL2A3Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Dec 2015 19:29:24 -0500
In-reply-to: <0837727b57d573988a47f3ecb22918e9771e8dbe.1451314502.git.geliangtang@163.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Geliang Tang <geliangtang@163.com>, Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi Geliang,

On 2015=EB=85=84 12=EC=9B=94 29=EC=9D=BC 00:00, Geliang Tang wrote:
> Use to_i2c_client() instead of open-coding it.
>=20
> Signed-off-by: Geliang Tang <geliangtang@163.com>
> ---
>  drivers/mfd/88pm80x.c       | 4 ++--
>  drivers/mfd/88pm860x-core.c | 4 ++--
>  drivers/mfd/max14577.c      | 4 ++--
>  drivers/mfd/max77686.c      | 4 ++--
>  drivers/mfd/max77693.c      | 4 ++--
>  drivers/mfd/max77843.c      | 4 ++--
>  drivers/mfd/max8925-i2c.c   | 4 ++--
>  drivers/mfd/max8997.c       | 8 ++++----
>  drivers/mfd/max8998.c       | 8 ++++----
>  drivers/mfd/sec-core.c      | 4 ++--
>  10 files changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi

[snip]
