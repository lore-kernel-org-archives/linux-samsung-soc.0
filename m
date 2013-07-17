From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] clk: samsung: Staticise non-exported symbols
Date: Wed, 17 Jul 2013 19:56:52 +0530
Message-ID: <CAK9yfHxdL0KpS0R_zBqiRGO=E-PMkv6JfwZpyTrHL0nPv3iCgQ@mail.gmail.com>
References: <1374058786-16603-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:52059 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754061Ab3GQO0x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Jul 2013 10:26:53 -0400
Received: by mail-oa0-f46.google.com with SMTP id h1so2637813oag.33
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jul 2013 07:26:52 -0700 (PDT)
In-Reply-To: <1374058786-16603-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On 17 July 2013 16:29, Mark Brown <broonie@kernel.org> wrote:
> From: Mark Brown <broonie@linaro.org>
>
> This avoids polluting the global namespace and silences lots of sparse
> warnings. The change pushes us over 80 columns a lot but I couldn't see
> a tasteful place to break the lines as-is.
>
> Signed-off-by: Mark Brown <broonie@linaro.org>

I have already posted a series which does similar things:
comments.gmane.org/gmane.linux.kernel.samsung-soc/20696


-- 
With warm regards,
Sachin
