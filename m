From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] mfd: sec-core: Rename MFD and regulator names
 differently
Date: Mon, 02 Nov 2015 13:19:28 +0900
Message-ID: <5636E450.80002@samsung.com>
References: <1446437169-29550-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:63409 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751332AbbKBETj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Nov 2015 23:19:39 -0500
In-reply-to: <1446437169-29550-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, lee.jones@linaro.org, broonie@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 02.11.2015 13:06, Alim Akhtar wrote:
> Currently S2MPSXX multifunction device is named as *-pmic,
> and these MFDs also supports regulator as a one of its MFD cell which
> has the same name, because current name is confusing and we want to
> sort it out.
> 
> We did discussed different approaches about how the MFD and it
> cells need to be named here [1].
> Based in the discussion this patch rename MFD regulator name as
> *-regulator instead of current *-pmic.
> 
> This patch also changes the corresponding entries in the regulator driver
> to keep git-bisect happy.
> 
> [1]-> https://lkml.org/lkml/2015/10/28/417
> 
> Suggested-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
> Changes since V1:
> * Squashed the two patches in one as sugeested by Lee
> * Based on the top of [1]
> [1]-> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg47736.html
> 
>  drivers/mfd/sec-core.c      |    8 ++++----
>  drivers/regulator/s2mps11.c |    8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 

Looks good:


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
