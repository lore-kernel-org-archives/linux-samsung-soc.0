From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] mfd: use to_i2c_client
Date: Tue, 29 Dec 2015 08:56:39 +0900
Message-ID: <5681CC37.1050402@samsung.com>
References: <0837727b57d573988a47f3ecb22918e9771e8dbe.1451314502.git.geliangtang@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:48698 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752798AbbL1X4o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Dec 2015 18:56:44 -0500
In-reply-to: <0837727b57d573988a47f3ecb22918e9771e8dbe.1451314502.git.geliangtang@163.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Geliang Tang <geliangtang@163.com>, Lee Jones <lee.jones@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On 29.12.2015 00:00, Geliang Tang wrote:
> Use to_i2c_client() instead of open-coding it.
> 
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

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
