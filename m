From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos3250: fix mout_cam_blk parent list
Date: Mon, 22 Sep 2014 10:35:59 +0200
Message-ID: <541FDF6F.6090903@gmail.com>
References: <1410008613-20861-1-git-send-email-pankaj.dubey@samsung.com> <540EF177.8090005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:41262 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753076AbaIVIgE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 04:36:04 -0400
In-Reply-To: <540EF177.8090005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com

On 09.09.2014 14:24, Krzysztof Koz=C5=82owski wrote:
> On 06.09.2014 15:03, Pankaj Dubey wrote:
>> As per user manual of Exynos3250 SRC_CAM can select
>> div_cam_blk_320 if it's value is 0xC, so placing
>> div_cam_blk_320 at proper index in parent list of mout_cam_blk.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos3250.c |    1 +
>>   1 file changed, 1 insertion(+)
>=20
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Applied for next.

Best regards,
Tomasz
