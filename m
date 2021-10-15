Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C396DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 14:35:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A851B61351
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 14:35:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240396AbhJOOhk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 10:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240382AbhJOOhe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 10:37:34 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A94C06176D
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 07:35:27 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id i15so18534163uap.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dyzl3P7DZRGqshOKvxCFF4c9hztnCOx9dCdEwf3z48o=;
        b=fCA1/Mx8Wx4HD26C2GobDtiFNBVWxx8Apth/0bJpJefFV7OQ5MrVIPgRMBNyaL9Byd
         rxFQKH2tLsYFV/Hc2JnK5uXbTVoRCAtzQk5nKO5QKqo8d68U6SJALbtbTNT/ttOB8IjN
         AErQmd4AFqCMtvXRkJ0Lqr0+ijfzJvtNHUd5vr4lSFwT15xLYCuzYa3Y2T7uw/a75y4R
         fIAGEKLQWswk6amv4HFks4L5FKoiqjWSJJdWERS3RMYIRmkopRHqsnWvsKEVvCXHQdpi
         aemyj4+A/h1bLfcxYClQ9XvarVa+TBIPiqeGDXkZvB8cYOwJLiWlLOwfwfA1LbccB2In
         Tr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dyzl3P7DZRGqshOKvxCFF4c9hztnCOx9dCdEwf3z48o=;
        b=MaLTKSpB3eCAnp2UlQVOVG6UTXqUDXs/wVGbg0vjnOGmtAisyWC3HUkIPv5wCJlble
         O+ecxBf+tit6+/G4Lm9bVq6Xjtn6W5OCJMRF14XoqW5mCSKiRSThAF4YAPsZHUgC3ygZ
         Fx29eO2U043Ik4CSVbG4v67xF9qcA/7coR8WWHW56+15sJSIdE067Ev6pKRxG04Y9aus
         rfOVoLP5sxNEiZyiSI1s2k8nh8U+iH3aIIVWOa4qy+YDBuoADhwxLn/l1h9a6uz8Jv8p
         MjDz03OeDILatCw6SyjlQP88QI9ebl2TrEqC4WqnvgAP2GBIgXMJiD7QB2QOVbANnZrK
         zP1g==
X-Gm-Message-State: AOAM533jcB5RO1OdYLfrGuVnjulaitCeyFQ8dGPPDQo+fUDavnl2ADQW
        Lmx/HqV1aaafKF+NkLOO1+80Iv4Mx6wP1Y/chZehzA==
X-Google-Smtp-Source: ABdhPJw1G6RrMl0a+Cbkl9++iuc5F7VDW14l2hO3UQMme2WeLYVa/Brsyt2UcPIYPAS9JbdJyMVvqad8L7w4GXy58g4=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr14401258vsh.30.1634308526705;
 Fri, 15 Oct 2021 07:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211008154352.19519-1-semen.protsenko@linaro.org>
 <20211008154352.19519-6-semen.protsenko@linaro.org> <CAPLW+4n41GY_OszS=VgzgywVrD+epY1NTmwL1ghHZ=0DCYcbYQ@mail.gmail.com>
 <a98f7f83-8478-aa38-7699-0a5dce44616d@kernel.org>
In-Reply-To: <a98f7f83-8478-aa38-7699-0a5dce44616d@kernel.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 15 Oct 2021 17:35:15 +0300
Message-ID: <CAPLW+4kXbon+m_px-CuqUqdYTJE0V=bMxqqzyLSn37Lr=nAU7g@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] clk: samsung: Introduce Exynos850 clock driver
To:     Sylwester Nawrocki <snawrocki@kernel.org>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 15 Oct 2021 at 16:30, Sylwester Nawrocki <snawrocki@kernel.org> wrote:
>
> Hi Sam,
>
> On 12.10.2021 10:14, Sam Protsenko wrote:
> > Hi Sylwester,
> >
> > On Fri, 8 Oct 2021 at 18:44, Sam Protsenko<semen.protsenko@linaro.org>  wrote:
> >> This is the initial implementation adding only basic clocks like UART,
> >> MMC, I2C and corresponding parent clocks. Design is influenced by
> >> Exynos5433 clock driver.
> [...]
> >> Signed-off-by: Sam Protsenko<semen.protsenko@linaro.org>
> >> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
> >> ---
> > Can we also apply this one?
>
> I think so, apologies for a bit excessive latency on my side. The patch looks
> good to me, I have just applied it to clk-samsung tree. Thank you for your work
> and good luck in upstreaming remaining parts of the exynos850 platform.
>
>

Thank you, Sylwester! A lot of work remains to be done on E850 clock
driver, so I guess I'll be bothering you soon enough :)
