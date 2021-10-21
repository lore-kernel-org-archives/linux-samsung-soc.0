Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C29FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 05:51:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79D7B6109F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 05:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhJUFxb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 01:53:31 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:61016 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhJUFxa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 01:53:30 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211021055113epoutp01abe3f3260301a3e540585ca12cf6a938~v9dJfCo7R1918919189epoutp01l
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 05:51:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211021055113epoutp01abe3f3260301a3e540585ca12cf6a938~v9dJfCo7R1918919189epoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634795473;
        bh=pNEo06XvYaDJRHf1pn103zlDiMsjb06V0T6QEzCvo5s=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Wc0ZE4gvOdoUwOEcI//YBn70d/IoohM5PLs6M4zZNgxSEJoAxBfbXdOUbo3rWGYMU
         BvwPQdg4DP/hlwUL5b1kIjmaKSnqvqp/4hjDE5LN1F9PvujTQYdP6WGXiBO8glSYXu
         cP6Eg8FOksOjelW6NLPF5jJ1O/Me8wZWygYOUjwA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211021055113epcas2p1cdbed912f25268d847f0fcbaba1bca1e~v9dI4zgGT0981309813epcas2p1M;
        Thu, 21 Oct 2021 05:51:13 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.102]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HZc6K0xNLz4x9QS; Thu, 21 Oct
        2021 05:51:05 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        96.25.09868.8CFF0716; Thu, 21 Oct 2021 14:51:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20211021055104epcas2p4bd5278e58860af8c136a850c0f080087~v9dA4CRQG0822508225epcas2p4_;
        Thu, 21 Oct 2021 05:51:04 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211021055104epsmtrp1b879e5806c633e3d585f66f562247aa3~v9dA2hNrV1897018970epsmtrp1U;
        Thu, 21 Oct 2021 05:51:04 +0000 (GMT)
X-AuditID: b6c32a45-9b9ff7000000268c-4a-6170ffc857a5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        83.C8.08738.8CFF0716; Thu, 21 Oct 2021 14:51:04 +0900 (KST)
Received: from localhost.localdomain (unknown [12.36.155.123]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211021055104epsmtip2b84deef7ced2acbc15f589e007379382~v9dAn8oUD2936229362epsmtip2j;
        Thu, 21 Oct 2021 05:51:04 +0000 (GMT)
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     krzysztof.kozlowski@canonical.com
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH v1 0/2] Indroduce Exynos Multi Core Timer version 2
Date:   Thu, 21 Oct 2021 15:18:02 +0900
Message-Id: <20211021061804.39118-1-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmme6J/wWJBt9uGlrM+yxr0bT/ErPF
        8bWvWS02vv3BZLHp8TVWi8u75rBZzDi/j8li8eMVTBb/eg8yWmzeNJXZYvGBT+wO3B6zGnrZ
        PO5c28Pm8e7cOXaPzUvqPfq2rGL0+LxJLoAtKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTM
        wFDX0NLCXEkhLzE31VbJxSdA1y0zB+g6JYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpB
        Sk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xt65r9gLtnBUbHl2hqmB8SpbFyMnh4SAicTX
        Z3vZuxi5OIQEdjBKzDrUwALhfGKUuHXqKpTzmVGisekIYxcjB1jLkT8pEPFdjBJbX69FKDq7
        7hgLyFw2AV2JbSf+MYLYIgKqEvN2dILtYxZYySTxYroTiC0s4Cwx9/sUZhCbBajmxYLrYPW8
        ArYSbw+9Y4G4T17iyK9OZoi4oMTJmU9YIObISzRvnc0MUfORXaJhezqE7SKxvmcFI4QtLPHq
        +BZ2CFtK4mV/G5RdL7F421JmkKMlBCYwSszf9AEqYSwx61k72JfMApoS63fpQzysLHHkFtRa
        PomOw3/ZIcK8Eh1tQhCNahK/pmyA2iojsXvxCqjLPCS61/WBxYUEYiWu9a9nm8AoPwvJM7OQ
        PDMLYe8CRuZVjGKpBcW56anFRgWG8DhNzs/dxAhOn1quOxgnv/2gd4iRiYPxEKMEB7OSCO/u
        ivxEId6UxMqq1KL8+KLSnNTiQ4ymwOCdyCwlmpwPTOB5JfGGJpYGJmZmhuZGpgbmSuK8lqLZ
        iUIC6YklqdmpqQWpRTB9TBycUg1MJVfY1ykl1i1udT7Vdq+mX0u36unEbQzqbVszv75N8vOq
        87nged+F79bHybETrzzb6i2/ee7R8zwZF+/vT1d6sfXNjM7kvUz3p4sobS2LDb/y4YzYS+Nd
        ttOr2mKDRZVZN6Xmttulz5n+8D3P/aISKd7YSrW7/5b+rb11sM79fNoSOxPu7vUn3HJrozg/
        R0y/eoVhzo2/d6bdWHTvVvU8Bv2e17u0NN5Xbjyl5uW/yffd52+P578/mXprfqr6yR1unFFz
        jqfzhN52iRPbpfPWotdBI/DF1vWsx3xDpz15+7Z4rtG0lU9cJ7wNurgw3nhX74Ge2NrC01J2
        Rz8u5+RPmBkzZWZNWp/Xskce/eksUkosxRmJhlrMRcWJAEpyqywoBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsWy7bCSvO6J/wWJBn8niVvM+yxr0bT/ErPF
        8bWvWS02vv3BZLHp8TVWi8u75rBZzDi/j8li8eMVTBb/eg8yWmzeNJXZYvGBT+wO3B6zGnrZ
        PO5c28Pm8e7cOXaPzUvqPfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugStj79xX7AVbOCq2PDvD
        1MB4la2LkYNDQsBE4siflC5GLg4hgR2MElcPHWbpYuQEistI3F55mRXCFpa433KEFaLoI6PE
        neVb2EESbAK6EttO/GMEsUUEVCXm7ehkAyliFtjMJHHl7QQ2kISwgLPE3O9TmEFsFqCiFwuu
        gzXwCthKvD30DmqbvMSRX53MEHFBiZMzn4DFmYHizVtnM09g5JuFJDULSWoBI9MqRsnUguLc
        9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgoNbS2sG4Z9UHvUOMTByMhxglOJiVRHh3V+QnCvGm
        JFZWpRblxxeV5qQWH2KU5mBREue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cDUeu+b2uQVefnx
        meITJfmO2nZcyOfryX4v0bxmbTb7lm7ukzc+puYdLd44p+e+iQSbmmPJVX+PLPErf0Ol/gRv
        myVU2pvJ0Kd28FC5v8Tc1mcWa9642FRMUhL+d1Mj3yJGuCzDIHpSzS07PfdZdQVGbUs8P9qW
        3bLmmW/+V6jU1/ZThbiYdJxw22/vp6umZyvM2/hkju+cL33G4Zr5KduWe3zn+JK9aaHjtjaj
        yOc1F9oX/cpf/pC77mrS9/VmXs9uLWXaW2j0/mbNktIXX39cdz9jkJTTXClxJPHHozIXoUOr
        4s50rzhfVpK9Xd795fTK6L7pDreimkTF1X/1r/MoPv3o6/cYdc7fPpqTjZRYijMSDbWYi4oT
        AXC1IIjZAgAA
X-CMS-MailID: 20211021055104epcas2p4bd5278e58860af8c136a850c0f080087
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211021055104epcas2p4bd5278e58860af8c136a850c0f080087
References: <CGME20211021055104epcas2p4bd5278e58860af8c136a850c0f080087@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos Multi Core Timer version 2 is a new main system timer of next Exynos SoC.
Exynos MCT v2 consists of 1 64bit FRC(Free Running Counter) and 12 comparators.
Each comaprator produces interrupt when the value of comparators matches with the value of FRC.
So, 12 comaprators can be used as local timer of each CPU.

Youngmin Nam (2):
  clocksource/drivers/exynos_mct_v2: introduce Exynos MCT version 2
    driver for next Exynos SoC
  dt-bindings: timer: samsung,s5e99xx-mct: Document s5e99xx-mct bindings

 .../bindings/timer/samsung,s5e99xx-mct.yaml   |  91 +++++
 drivers/clocksource/Kconfig                   |   6 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/exynos_mct_v2.c           | 336 ++++++++++++++++++
 drivers/clocksource/exynos_mct_v2.h           |  74 ++++
 5 files changed, 508 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/samsung,s5e99xx-mct.yaml
 create mode 100644 drivers/clocksource/exynos_mct_v2.c
 create mode 100644 drivers/clocksource/exynos_mct_v2.h

-- 
2.33.0

