Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5303CE7AF8
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Sep 2023 05:52:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjI1Fw5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Sep 2023 01:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbjI1Fwz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 01:52:55 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69F6BF
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Sep 2023 22:52:52 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso1659614166b.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Sep 2023 22:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695880371; x=1696485171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiermC2FyF18zETaEZYprIWZt0kw0ddRV7cxIGTZIGU=;
        b=ZT5dpyvHSQ5AuXMQyZk4/XuYSFtGVDD/UnZCmJsugKBQ0Wr1j+Y0BW+TpQB957l+sz
         K8EOahnpOSA3X7WQefoWXNzvt4hA8L3e8LqpoY0PKko4QMLyHMbN6q3IOeW+KQWc8icG
         k9DzJo9it56jcde5l4mY+IvIl2Mgwn2puO3/feAfJK/rXFQTysrpzSZiAtTosmI4s4rl
         mYc8PCCyXCF2bMiPkpmLN41OT76oVl5jG+5mtnTx7rw44o/T50t7pS2Ylpv1mxToUklr
         cj6M3eULbjHm7dumb/lIWIthZo6aQsAeZH2xVTGvbwvTR7KlS73gwDqbIjHmSw7igNs+
         zbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695880371; x=1696485171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiermC2FyF18zETaEZYprIWZt0kw0ddRV7cxIGTZIGU=;
        b=nfe0UDczGE9jRLDHg6vBY41PwUmz4TqcWfdSDb643DzZIXEC5UfGcVA+Rwrv6LgGmh
         Ge11aLFb4b8/OtB3VbdhH38MgwMlqmN0zRYCuW2V8DhYsW5KD2axVpwdDQ6fzt9RDNCO
         afQ2UKMVg9SxyI1TNC27en3cVBXX3Rb4uRAJR64L/0C0mRIOixeJDu/PcqBwoePVCedw
         6RVO0pPfkOHD4irp6nQAXTkX1XRPYpO7H62a21iFnH/bnC4oehDT1vPwH4H6cliwEJgp
         nJxZprJbVaSM9xyMHKvOpuLTAw4e9jO62XJ+8vGR4iptQgAAwGAydffgqn7F4stW9VjL
         SlBg==
X-Gm-Message-State: AOJu0YwJM8zlAIMuOy2O31BtCCbfWFHTMicTv0jMc6ollHDYxtBIqzBe
        cSpHIfLkjDNYDrsGLpEXD/IlAw==
X-Google-Smtp-Source: AGHT+IECXd2SHWusjF1ZvJH6wJsyg8mQKDkU8guO8NQ037K/NGiIVih0u3a06H3//Q6E4sdYH4h/lw==
X-Received: by 2002:a17:906:1d2:b0:9b2:7657:87c0 with SMTP id 18-20020a17090601d200b009b2765787c0mr228675ejj.51.1695880371406;
        Wed, 27 Sep 2023 22:52:51 -0700 (PDT)
Received: from krzk-bin.homenet.telecomitalia.it (host-87-4-82-94.retail.telecomitalia.it. [87.4.82.94])
        by smtp.gmail.com with ESMTPSA id gq23-20020a170906e25700b009ad75d318ffsm10394942ejb.17.2023.09.27.22.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 22:52:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: (subset) [PATCH 31/40] soc/samsung: exynos-chipid: Convert to platform remove callback returning void
Date:   Thu, 28 Sep 2023 07:52:48 +0200
Message-Id: <169588036457.9866.18271301259272655918.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925095532.1984344-32-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de> <20230925095532.1984344-32-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Mon, 25 Sep 2023 11:55:22 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Applied, thanks!

[31/40] soc/samsung: exynos-chipid: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux/c/0da7c05d232dc015ab421771bb71cdbfb46e0d67

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
