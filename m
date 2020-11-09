Return-Path: <SRS0=H6Ng=EP=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4CFC56202
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 02:17:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D71A206E3
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 02:17:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CESyEzoW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729349AbgKICRa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 8 Nov 2020 21:17:30 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:56084 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729360AbgKICR3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Nov 2020 21:17:29 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20201109021726epoutp0183f91c2ffaf34050e920c25590b41d4f~FtVtTRKP12015320153epoutp01Z
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2020 02:17:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20201109021726epoutp0183f91c2ffaf34050e920c25590b41d4f~FtVtTRKP12015320153epoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604888246;
        bh=GdZ3kpFsfFHZgYVX7DnIRuZtVyD7hKJ6UCvQcYxuNHo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=CESyEzoWyDgc1Aa/yWE4Yv06MyxarxttfdLH932c2ymRhzTLmJVa487MO3CkuEwix
         iexDvKWAseRUM3aVmsjSow0GOgEMkU2vzr9GpM4/80vT9buJ4GzymP/QTxQlnSMPVR
         Lw7OX/c6sZo8TkSXxRRWf0qjyDuZfzuKVj7Ew0tI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201109021724epcas1p21ee4582e75ec42f1c9780efc743de7a2~FtVsPtGOy1901519015epcas1p2C;
        Mon,  9 Nov 2020 02:17:24 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.152]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4CTvlR0d9qzMqYkg; Mon,  9 Nov
        2020 02:17:23 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        36.A5.09582.0B6A8AF5; Mon,  9 Nov 2020 11:17:20 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201109021720epcas1p1ad062afcbb0f4542933298bbd4fdf74a~FtVn602dv1912019120epcas1p1s;
        Mon,  9 Nov 2020 02:17:20 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201109021720epsmtrp1a2a547b68720a702aee663b713a58900~FtVn6CgEG1135411354epsmtrp1u;
        Mon,  9 Nov 2020 02:17:20 +0000 (GMT)
X-AuditID: b6c32a37-899ff7000000256e-e7-5fa8a6b07017
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        B5.BB.08745.0B6A8AF5; Mon,  9 Nov 2020 11:17:20 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201109021720epsmtip190846264496f8a2443971f13d8f429ef~FtVnqLMyT1779217792epsmtip1y;
        Mon,  9 Nov 2020 02:17:20 +0000 (GMT)
Subject: Re: [PATCH v2 03/16] drm/exynos: use exynos_dsi as drvdata
To:     Sam Ravnborg <sam@ravnborg.org>,
        Michael Tretter <m.tretter@pengutronix.de>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        jy0922.shim@samsung.com, b.zolnierkie@samsung.com,
        narmstrong@baylibre.com, sw0312.kim@samsung.com, krzk@kernel.org,
        a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, sylvester.nawrocki@gmail.com
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <cce25c2b-5902-d267-4b1e-fd95b6f8a091@samsung.com>
Date:   Mon, 9 Nov 2020 11:24:41 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20201107222425.GC1052534@ravnborg.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJJsWRmVeSWpSXmKPExsWy7bCmru6GZSviDY7eUra4te4cq8XGGetZ
        La58fc9m8eLeRRaLVVN3slicP7+B3aJz4hJ2ixnn9zFZbFsBVHeoL9pixc+tjBYzJr9ks5j3
        eSeTA6/H+xut7B47Z91l95jdMZPVY9OqTjaP+93HmTz6/xp4LJl2lc2jb8sqRo/Pm+QCOKOy
        bTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOAzlZSKEvM
        KQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFFgW6BUn5haX5qXrJefnWhkaGBiZAhUmZGf8
        fd/DVPCKueLTjqtsDYxNzF2MnBwSAiYSZ5+8BrK5OIQEdjBKHJjfBeV8YpT4NmkFlPOZUWJ1
        fzs7TMuRCa+ZIBK7GCWaH9+Ect4zSuw8NZsRpEpYwFli1f1eMFtEIFDi1ONbYAuZBTYwSWy+
        ZgFiswmoSkxccZ+ti5GDg1fATqJrhiRImEVAReLbo/tgraICERLHuyeDLeYVEJQ4OfMJC4jN
        CXTEq8O3GCFGikvcejKfCcKWl2jeOhvsagmBCxwSvTO6WCCudpGYcHwyK4QtLPHq+Baob6Qk
        Xva3sUM0NDNKTJxxmgnC6WCUuPv4OlS3scT+pZOZQC5lFtCUWL9LHyKsKLHz91yoK/gk3n3t
        YQUpkRDglehoE4IoUZI4dvEGI4QtIXFhyUQ2CNtD4uaZzYwTGBVnIfltFpJ/ZiH5ZxbC4gWM
        LKsYxVILinPTU4sNC4yRo3sTIzhNa5nvYJz29oPeIUYmDsZDjBIczEoivC0uy+KFeFMSK6tS
        i/Lji0pzUosPMZoCQ3sis5Rocj4wU+SVxBuaGhkbG1uYGJqZGhoqifP+0e6IFxJITyxJzU5N
        LUgtgulj4uCUamB6kB+w3npPwQppw8Mdxds3ftCPPOXInXsw5OOsCvXbiRdLShfl3OXO/73N
        9k5L59ZFh6ztvexCmw5uX3xIZr/7Blatd4bsnheXyXxse/eYyVFkW3mbxZtNvfeuc1517q/2
        CtDn55norcx3a9srv5CrzVLnEpasVCje+5hRasrZtM1HynfXhPE22Zd8EmN4EpvhEHdxzQKW
        x0dc1Vd/Y1OPuPLar3DCLqvvO1v4ewxy8ow/H7rDpujZ+6SIhW1m0pJc3XzBXv+1YUIzDga8
        3a94ueO6RdaC/YZFLTNzTNJ051kFh7UqTC46EvWz3OOvq5208aSPBgdDmi4HvF/evzqpLL1a
        a+Msvh9J9dvUlyixFGckGmoxFxUnAgCT+xYJXAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsWy7bCSnO6GZSviDbbf5ba4te4cq8XGGetZ
        La58fc9m8eLeRRaLVVN3slicP7+B3aJz4hJ2ixnn9zFZbFsBVHeoL9pixc+tjBYzJr9ks5j3
        eSeTA6/H+xut7B47Z91l95jdMZPVY9OqTjaP+93HmTz6/xp4LJl2lc2jb8sqRo/Pm+QCOKO4
        bFJSczLLUov07RK4Mv6+72EqeMVc8WnHVbYGxibmLkZODgkBE4kjE14zdTFycQgJ7GCU6F8y
        l6WLkQMoISGxZSsHhCkscfhwMUTJW0aJdw0TWUB6hQWcJVbd72UEsUUEAiVami6DxZkFNjBJ
        7F+RCtHwmVHi5edesGVsAqoSE1fcZwMZyitgJ9E1QxIkzCKgIvHt0X2wOaICERIt9/+wg9i8
        AoISJ2c+AZvJCXTnq8O3GCHmq0v8mXeJGcIWl7j1ZD4ThC0v0bx1NvMERqFZSNpnIWmZhaRl
        FpKWBYwsqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxgmNSS2sH455VH/QOMTJxMB5i
        lOBgVhLhbXFZFi/Em5JYWZValB9fVJqTWnyIUZqDRUmc9+ushXFCAumJJanZqakFqUUwWSYO
        TqkGptzqyRLvXkxXnLTxjk+jrnLFJYmjMW93GVgc1gp7v/ezneeJ9ynbHv2xt/cUKor/+n2y
        52x+k9fXBEUeX53y89wXo0nvlB0nRGs5Zs6tPNHQ1LbwcensY43Gpt+neTJP1phqkc8x8/jE
        ewHNz2YJMin8czJ/F5Dtb8M4Rf128CaZdT3KXB/TDsZlTZ69OMFHyJeLLcQge/VTVeFAh6Y7
        sTpTD1mdCJ7MGFAS8jEs2+2Lx3POSK5TfyecX7AyjKU8L0Ol9ZL8g4C7U1ZPj92f4/Ric//t
        /DMsR5TX8nXYH7F6dYCpwtnYVqHT+uiidjkxId/QI7GLVTqvLN5xOEgq1Chi4YKvTo+lcvwc
        XnRxKbEUZyQaajEXFScCAN8M3eI4AwAA
X-CMS-MailID: 20201109021720epcas1p1ad062afcbb0f4542933298bbd4fdf74a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201107222432epcas1p3fa1c76cd2a4f4687e117cbcbf7bd90d6
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
        <20200911135413.3654800-4-m.tretter@pengutronix.de>
        <CGME20201107222432epcas1p3fa1c76cd2a4f4687e117cbcbf7bd90d6@epcas1p3.samsung.com>
        <20201107222425.GC1052534@ravnborg.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 11. 8. 오전 7:24에 Sam Ravnborg 이(가) 쓴 글:
> On Fri, Sep 11, 2020 at 03:54:00PM +0200, Michael Tretter wrote:
>> Use the exynos_dsi as drvdata instead of the encoder to further decouple
>> the driver from the encoder.
>>
>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Likewise, the exynos people are expected to pick this up.

Cleanup patch so picked it up.

Thanks,
Inki Dae


> 
> 	Sam
> 
