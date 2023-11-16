Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CA9C47071
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Nov 2023 19:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbjKPTsU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Nov 2023 14:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjKPTsT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Nov 2023 14:48:19 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E24418D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Nov 2023 11:48:16 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6d67d32adc2so657137a34.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Nov 2023 11:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700164096; x=1700768896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3OcoAEEUB5yTmwghQcOiwfPt5PpUrcok2RW92KGkq8=;
        b=XHqgm9sf3AcWBy29v0pzeRXsHtHNiyCCEIqK/o3D2isLmsnwV/E/YbC1RVRcHLdex4
         NBMa6Y4i7K3YwwJcJ3g+iLAXkXQFZ31XPok1hCAmsdHeiFL8lhDk367cAJE2DSDkK58n
         rNSa+m0ENrOXx00rmO5TK9GEoNVNpqHEfN7j8QkbHVQ3ugi7ieNdvRTwYc/Z20qKZsGB
         2sFrt3kf9gBlXex0u6jDGhQmamv8WQjlSa4iTu6rlEXoL/dWSG4V17T+yTZ+jMxR8sHX
         70lFEloPm62b/CjTnR101tK9wIhKJcw2QN8mgXsZVcoE9Eu/jlw8UlsoQL5zQfezQVpU
         hFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700164096; x=1700768896;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3OcoAEEUB5yTmwghQcOiwfPt5PpUrcok2RW92KGkq8=;
        b=mNVnzrzpJ2WNWwG8SG+2FKilOuFoSEVirKKufcSz6MsSsTPnEw+fG0KK+2/1tjAPZM
         vyOzMJWCd5jmXuODtSeUo07XzhtTji6VFQBgUZi+HfZvPmScUOAZLgPlaf+7DtTqhjLY
         r0E01kt4y/ywSLMmDy0200YX3h5gOxIcp07tZ0HlZatz0+nSZ0PsfRut8daGlRme2YW3
         DgP3q3gvo8Bu2lCPe5gRs3nhlQ63vFJbEwTzP+TOfrnH6sVV9eafwQZpA87TRvwrB0NE
         kO9wFey1EgmTKuhCoz4qgdMr0dW48nKiMIPdroUTffv02csaTel+XNilI7jFq12f83U7
         /zvw==
X-Gm-Message-State: AOJu0YyQH/gC+30GR05uFVpfUTfvYHC1RMBL1ckQm59fXjX5J/EjqN83
        vHzbLc1ZA4m8449UC8sjPKDFew==
X-Google-Smtp-Source: AGHT+IE3G+HEnu7WHpEhXTLqvMVgyb6ogQof8gOswyl6XPZq0dtSurfkNadh2IpryXNB5zPfqALH/g==
X-Received: by 2002:a05:687c:218d:b0:1f0:811a:324d with SMTP id yl13-20020a05687c218d00b001f0811a324dmr21329261oab.51.1700164095937;
        Thu, 16 Nov 2023 11:48:15 -0800 (PST)
Received: from [127.0.1.1] ([12.161.6.169])
        by smtp.gmail.com with ESMTPSA id c8-20020a37e108000000b0077412ca0ae1sm50384qkm.65.2023.11.16.11.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 11:48:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org, Petr Vorel <pvorel@suse.cz>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
In-Reply-To: <20231108085630.7767-1-pvorel@suse.cz>
References: <20231108085630.7767-1-pvorel@suse.cz>
Subject: Re: [PATCH 1/1] MAINTAINERS: Remove snawrocki's git tree
Message-Id: <170016409362.24726.16606649260683112688.b4-ty@linaro.org>
Date:   Thu, 16 Nov 2023 20:48:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Wed, 08 Nov 2023 09:56:30 +0100, Petr Vorel wrote:
> There is already krzk/linux.git listed, which is currently used.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Remove snawrocki's git tree
      https://git.kernel.org/pinctrl/samsung/c/e4e2fbe7d7d70ce52adeca7ef933488ebfe78f03

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

