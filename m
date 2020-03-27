Return-Path: <SRS0=2lPF=5M=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63ACC43331
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 07:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2F2920705
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 07:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="N3wlaiuu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgC0HpV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Mar 2020 03:45:21 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47083 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgC0HpV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 03:45:21 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200327074519euoutp02d7e5292c418fe767e54bcbe598416837~AGYMk456R1609216092euoutp02h
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 07:45:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200327074519euoutp02d7e5292c418fe767e54bcbe598416837~AGYMk456R1609216092euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585295119;
        bh=NUSMCJoncyuXruOq40oOech4q/muYFHVc0DRAC7LPXg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=N3wlaiuuSOTRL31UGlWUmU2uz2co7SavZg96hgt3bP4V4NpQJd60LdI1558DpUElT
         b46bK8TWdHY1qRyRp1iyZYzIvIVK7kvs6LIStMs0F9vgkFAijxoQZ+imCESrFETrIF
         Q8wBvpoC1pjvjJMOoHAQP3YZ8HcA7kc6p/avRMU4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200327074519eucas1p10edb21a7a8500c8f2d4f817a83a82ff0~AGYMVMhVP1721117211eucas1p11;
        Fri, 27 Mar 2020 07:45:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 8A.A2.61286.F0FAD7E5; Fri, 27
        Mar 2020 07:45:19 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200327074519eucas1p24e4a47abc022a18760f2d366fb073e94~AGYL-_i-S0909809098eucas1p2Y;
        Fri, 27 Mar 2020 07:45:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200327074519eusmtrp19aa412bbc9d6025a8184bfd3b01cd241~AGYL-VKOY0124801248eusmtrp1e;
        Fri, 27 Mar 2020 07:45:19 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-5b-5e7daf0fbe70
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 8B.65.07950.F0FAD7E5; Fri, 27
        Mar 2020 07:45:19 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200327074518eusmtip2e1f901c5e7329da357b9da48584c3918~AGYLdG58h2291722917eusmtip2H;
        Fri, 27 Mar 2020 07:45:18 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: sii9234: silence warning about regulators
 during deferred probe
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <db66a37b-69f0-9db3-6a7e-518a7c2d8a70@samsung.com>
Date:   Fri, 27 Mar 2020 08:45:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226101307.16708-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7r862vjDD5sU7TYOGM9q8WVr+/Z
        LK5+f8lscfLNVRaLzolL2C1mnN/HZLH2yF12i0N90Q4cHu9vtLJ7zO6YyepxYsIlJo/73ceZ
        PPq2rGL0ONA7mcXj8ya5APYoLpuU1JzMstQifbsEroy5J1tZC9azV3xs3cfewNjF1sXIySEh
        YCLxp+sNE4gtJLCCUeLsV70uRi4g+wujROPaWUwQzmdGidu3nsB1rH3ymhUisZxR4sWDzYwQ
        zltGiQPzLrKDVAkLJEns67vACGKLCJRKzP1/DCzOLPCSUWLdV0kQm01AU+Lv5ptAUzk4eAXs
        JBb2loKEWQRUJR6cmABWLioQITFt+z+wMbwCghInZz5hAbE5gcpf/ZzNBDFSXmL72znMELa4
        xK0n88GulhA4xi5xcM8esPkSAi4S/x54QjwgLPHq+BZ2CFtG4vTkHhYIu17i/ooWZojeDkaJ
        rRt2MkMkrCXunPsFNocZ6Ob1u/Qhwo4SN3r3sEKM55O48VYQ4gQ+iUnbpjNDhHklOtqEIKoV
        Je6f3Qo1UFxi6YWvbBMYlWYheWwWkmdmIXlmFsLeBYwsqxjFU0uLc9NTiw3zUsv1ihNzi0vz
        0vWS83M3MQJT0+l/xz/tYPx6KekQowAHoxIPr0ZLTZwQa2JZcWXuIUYJDmYlEd6nkUAh3pTE
        yqrUovz4otKc1OJDjNIcLErivMaLXsYKCaQnlqRmp6YWpBbBZJk4OKUaGFdtS1Nm9Oo69vb0
        3YniKwOfTbG+6H52mXTp3C8bd5zweHe46OhN4+dlc94n125fWKFWfXg9l/AbBe/m/VcOsx/6
        YGjsVSi987ONYMkew+QX7FwVf4rus67+el2s4n7ue432YOdJtb//hX6aYib743GtecS1ykfZ
        L/ave1ife0bj1eqdH+d+u3xGiaU4I9FQi7moOBEA0zYlM0kDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xe7r862vjDOYe4bLYOGM9q8WVr+/Z
        LK5+f8lscfLNVRaLzolL2C1mnN/HZLH2yF12i0N90Q4cHu9vtLJ7zO6YyepxYsIlJo/73ceZ
        PPq2rGL0ONA7mcXj8ya5APYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9
        O5uU1JzMstQifbsEvYy5J1tZC9azV3xs3cfewNjF1sXIySEhYCKx9slr1i5GLg4hgaWMElfX
        NbFAJMQlds9/ywxhC0v8uQbSAFL0mlFi0YN/YAlhgSSJfX0XGEFsEYFSiVf99xlBipgFXjJK
        HO09xwLRMZFR4v/i3WAdbAKaEn833wQaxcHBK2AnsbC3FCTMIqAq8eDEBHYQW1QgQuLxxHaw
        obwCghInZz4Bu4gTqPzVz9lMIDazgLrEn3mXmCFseYntb+dA2eISt57MZ5rAKDQLSfssJC2z
        kLTMQtKygJFlFaNIamlxbnpusZFecWJucWleul5yfu4mRmBMbjv2c8sOxq53wYcYBTgYlXh4
        NVpq4oRYE8uKK3MPMUpwMCuJ8D6NBArxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjBd5JXE
        G5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYMzg82Rh9NbbyP2rJuGj
        o5HGk7lTRe/8P8N56XTz0ZWrDNPyXqSKrq6MiOfl6GA2Wv3Nr7n2TLJpmVCtRBP7rAfzJp5c
        5fjlodUzw+mxNc0nvr2z5a57Z2smeTzzFFvdbomZl1lbWzknrLe70JN+Ucgu6Lr/dMMqVfUI
        M8EjSzj6vxcfixA9rcRSnJFoqMVcVJwIAFl6tFrfAgAA
X-CMS-MailID: 20200327074519eucas1p24e4a47abc022a18760f2d366fb073e94
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200226101316eucas1p2fd16a7c821632084710167216b78f6c5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200226101316eucas1p2fd16a7c821632084710167216b78f6c5
References: <CGME20200226101316eucas1p2fd16a7c821632084710167216b78f6c5@eucas1p2.samsung.com>
        <20200226101307.16708-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26.02.2020 11:13, Marek Szyprowski wrote:
> Don't confuse user with meaningless warning about failure in getting
> regulators in case of deferred probe.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/bridge/sii9234.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index f81f81b7051f..b1258f0ed205 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -836,7 +836,8 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>  	ctx->supplies[3].supply = "cvcc12";
>  	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
>  	if (ret) {
> -		dev_err(ctx->dev, "regulator_bulk failed\n");
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(ctx->dev, "regulator_bulk failed\n");
>  		return ret;
>  	}
>  

Queued to next.


Andrzej


