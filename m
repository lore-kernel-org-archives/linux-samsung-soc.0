Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8341C63797
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Jan 2023 14:00:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbjAPOA2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Jan 2023 09:00:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbjAPOAL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 09:00:11 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD0722794
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jan 2023 05:59:43 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id d62so14194327ybh.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jan 2023 05:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1ttIi9T1Jv8lKb+okwnGnQ8m/nJSHvTSd4dWJNzDLQ=;
        b=Vif8LIymrEdQfoBLSAnJaFmS5DhkZq2YJmQ0WHNKcOqgrS7vhbUV0ke5i7dnazftGr
         OB90m+1apbLbt5NKjRx3VF9QdlZzIMi+TIpsSaiYXIVygs3RH+YqlDQPvJBw26pw8cO6
         cgXec2cKjPCRY5rCPgrAjsPf7vnhhU6Ek0POsodoMIW1PbKdBXueB4TAqxQ/FI3uIeM6
         YXEl0RkchaAqubP0snNSXzucBZK35DISeNXKLMutsu2JQECylXQv4jbrBA3fzt86SltE
         1nT9tN2+5WDu7yQBtrnLl2FdOi0gvzAqFrE4X9J0w0bHW/OCOtheCbLlpIQXIaQXkm9J
         IRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1ttIi9T1Jv8lKb+okwnGnQ8m/nJSHvTSd4dWJNzDLQ=;
        b=ODf/3LGlrDhExh4HnEpGjJRI12lx2b8HMMMNsJm2yE//ALJNxcUEataySXYY6LNuTn
         KkqU9Zv5zrR49DshipkOFjSHii2OJqfl8s8S7YUOyT5gFfxiK/zuf0qdc4UmTrjzRm+w
         oq4HAl78zojiz10zeMfqo3ICTJHn4u7Fs89oUc8iTL9o9L+i9YbRavhh3mJwpumzTZBS
         LRmue+s5SdpCs7k2XPU9/iFFP/GP87mcc+1JrXJrP5gGKxlxJ/wfGXRoiCT//YWGw4zL
         zDctL15VfbtGUiymf9bHkCfL+3P2r13B81Hy+fst+927Zf5rB7CwNXb2APPngAuyZCJw
         2pZA==
X-Gm-Message-State: AFqh2kr8QJNdJXknThc7wFHLTtLA3BGKdGLyOjErhb4frO1yPWYhaPHk
        qoXmK0nMHYFZHbU2RW1OpekR5wJhGHnEbHouczBpSA==
X-Google-Smtp-Source: AMrXdXuYW9CqEWNtglBTG66rTDEihKTr/73litVxbhWFGCXJq+pZNNR4vVLxhzq7EJdQ3J84HuKxTZXJE0NHL9kP708=
X-Received: by 2002:a25:b07:0:b0:7d0:afc9:d194 with SMTP id
 7-20020a250b07000000b007d0afc9d194mr1183633ybl.341.1673877582408; Mon, 16 Jan
 2023 05:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20230112134849.59534-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112134849.59534-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Jan 2023 14:59:31 +0100
Message-ID: <CACRpkdZbkKzcB-P0g_-QpbL6Bgd0XQ45Ax=7WP+nNNZzLrNQ6A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: samsung: Do not mention legacy API in the code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Jan 12, 2023 at 2:48 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Replace mentioning of legacy API by the latest one.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
