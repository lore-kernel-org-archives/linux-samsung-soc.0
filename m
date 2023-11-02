Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE36C4167D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Nov 2023 01:32:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233315AbjKBBcM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Nov 2023 21:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232907AbjKBBcL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Nov 2023 21:32:11 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F35610C
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Nov 2023 18:32:05 -0700 (PDT)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231102013200epoutp04140d21a4ee3284658441d82916b52713~TqkpLQQFB1181411814epoutp04n
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Nov 2023 01:32:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231102013200epoutp04140d21a4ee3284658441d82916b52713~TqkpLQQFB1181411814epoutp04n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698888720;
        bh=6/sD0L4jgW+UPBuIjt2154BP4kWaTeBnEItmo7DE9rE=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=Ya0nYbGVAoOgybiSCdrY1s+YBO1u/kJcWTveDykX9VDPFlF1UyaZpMBVbJeK7VZF+
         xtVrilBwxRdtam4BAzmdLcTAHUfK4CeBCRKtWXkyWfoUkBIEKPW2cfxtwfO4O1Fcwg
         5PAAjOH8eat2744zg278IJZmYr8mQS9KUBe+ycAE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20231102013200epcas1p393e1e32b173f99d1765776e87344a8ec~TqkowYORP1244812448epcas1p3O;
        Thu,  2 Nov 2023 01:32:00 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.38.232]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4SLRDv16svz4x9Q5; Thu,  2 Nov
        2023 01:31:59 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
        DD.BF.19104.F0CF2456; Thu,  2 Nov 2023 10:31:59 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20231102013158epcas1p407546aa9264f6376ccfa95f2abc02b19~Tqknmy4dW0064600646epcas1p4y;
        Thu,  2 Nov 2023 01:31:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231102013158epsmtrp202deb95caff5bfea839e0a03570de501~TqknmK1se2187321873epsmtrp23;
        Thu,  2 Nov 2023 01:31:58 +0000 (GMT)
X-AuditID: b6c32a4c-559ff70000004aa0-27-6542fc0f4908
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        7E.7C.08755.E0CF2456; Thu,  2 Nov 2023 10:31:58 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20231102013158epsmtip11db5f933fcd9ca6d09ef15e6b9262ae2~TqknY4iUn1037210372epsmtip1F;
        Thu,  2 Nov 2023 01:31:58 +0000 (GMT)
From:   =?utf-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?= 
        <inki.dae@samsung.com>
To:     "'Marek Szyprowski'" <m.szyprowski@samsung.com>,
        <linux-samsung-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Cc:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Andi Shyti'" <andi.shyti@kernel.org>,
        "'Wolfram Sang'" <wsa@kernel.org>
In-Reply-To: <20231025121725.46028-2-m.szyprowski@samsung.com>
Subject: RE: [PATCH v2 1/3] i2c: s3c24xx: fix read transfers in polling mode
Date:   Thu, 2 Nov 2023 10:31:47 +0900
Message-ID: <07e001da0d2c$5f0360f0$1d0a22d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQFAtDqCAoG6rpZP+2s4rZk6TTwtCAISXrr3Aj0QF52xdnKzcA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmri7/H6dUg4MdbBYP5m1js7j/tYPR
        Yu/rrewWHX+/MFrMOL+PyWLtkbvsFnf3z2V0YPfYtKqTzePOtT1sHn1bVjF6fN4kF8ASlW2T
        kZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SBkkJZYk4p
        UCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAtECvODG3uDQvXS8vtcTK0MDAyBSoMCE7o79h
        FUvBF/6K/Q9VGxg7ebsYOTkkBEwkXk7fzN7FyMUhJLCHUeJ370FmCOcTo8S136fZQKqEBL4x
        Spy9VQ3TsbOrAapoL6PEzzN7GCGKXjJKrHgoBWKzCaRLvOy6zAJiiwiUSzw8tocNpIFZYBuj
        xNvzD8ASnAJ2Eic/LAdKcHAIC/hIvL7qARJmEVCRONA5G6yEV8BS4uCvm0wQtqDEyZlPwOLM
        AtoSyxa+ZoY4SEHi59NlrBBxEYnZnW3MICNFBJwktneVgKyVEGjlkDg34z8jRL2LxLGty5gg
        bGGJV8e3sEPYUhKf3+1lg2iYzChx5/oKFghnBqPE4Z/XobqNJfYvncwEsoFZQFNi/S59iLCi
        xM7fcxkhjuCTePe1hxWkREKAV6KjTQiiREni2MUbUFMkJC4smcg2gVFpFpLXZiF5bRaSd2Yh
        LFvAyLKKUSq1oDg3PTXZsMBQNy+1HB7fyfm5mxjB6VPLZwfj9/V/9Q4xMnEwHmKU4GBWEuE9
        bOqQKsSbklhZlVqUH19UmpNafIjRFBjgE5mlRJPzgQk8ryTe0MTSwMTMyNjEwtDMUEmcN+ZT
        e4qQQHpiSWp2ampBahFMHxMHp1QDUwTzkR3B+zf76E05tmWCHYfcAm3xgIR/vIcW/zo3sT18
        Wg+r9hvrzO5Sddu9Jk+qM6ecuuhgm2el+DvpkMWbT46XuI7NDfExP+3WqHjl1DqPjiO8J39u
        cH6/bePkzL83fvo9U1Vocb2Qv3PhsdcnziWcDSvzCDbkX6AtW77iiJDo2whpnwiPTn4ZExOe
        TXmc3/JPdTdbtBafutIQ9Y6B09a59Nm9/bMZIoRD8lutgvhC/96MOfBqzsle7vdJJ5aZyoi0
        uHvYh0z/sOR3wN4/39Mqe7pOsblGrHZOsK90m/9s79tfc7RLXbnFs5nPqPgcqH3Usuc+t53w
        6eu7uyZalq966tO1vn/+lW7u+2+alViKMxINtZiLihMBTSBfyCgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSnC7fH6dUg2WfdCwezNvGZnH/awej
        xd7XW9ktOv5+YbSYcX4fk8XaI3fZLe7un8vowO6xaVUnm8eda3vYPPq2rGL0+LxJLoAlissm
        JTUnsyy1SN8ugSuj88dUtoLT/BVdF3ayNTDe4uli5OSQEDCR2NnVwAxiCwnsZpT4tT6hi5ED
        KC4hsWUrB4QpLHH4cDFExXNGiaenZEDCbAKpEq9X14GYIgKVEt2bJLoYuTiYBXYwSrz8NYMR
        xBESOMgoMfPxObDpnAJ2Eic/LGcDaRAW8JF4fdUDJMwioCJxoHM2C4jNK2ApcfDXTSYIW1Di
        5MwnYHFmAW2JpzefwtnLFr5mhjheQeLn02WsEHERidmdbcwQ9zhJbO8qmcAoPAvJpFlIJs1C
        MmkWku4FjCyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGCI0dLcwfj9lUf9A4xMnEw
        HmKU4GBWEuE9bOqQKsSbklhZlVqUH19UmpNafIhRmoNFSZxX/EVvipBAemJJanZqakFqEUyW
        iYNTqoEpPUUrR2uV25K+B0kzN3s8NVgk+NfXy6DW6aYdZ8rm1YqFHP3+rxU9Nieea1UreODG
        ev3E5iJuv9/bzuo5/Do9o2pdQYQLe4Cm8Ye4a0GvOIXL3XP54j32H2R2qXj4PSuxbeG5LQyr
        6l3+TZfVa9xd2q7KuY75HmuTbF5PQUiBWpC84fkr2kvaFc/MfCr8d6JyE99Et1fKXlaZwZ59
        U9xdPJew6qk6Xt54ULyc5Y5JnQCHglO137vwM0/nFWxb+KJ+l4oRT2VTZbfs4YeGF9vmmy05
        9+HNr9O7TopdMU93mSfocj6i75LF3ZovxvvWb2Sb9r9l9+fbiwPkrh6yrK0/9Tebx8hJ3mtx
        y87Pt5RYijMSDbWYi4oTAVZBa7oLAwAA
X-CMS-MailID: 20231102013158epcas1p407546aa9264f6376ccfa95f2abc02b19
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
        <CGME20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f@eucas1p1.samsung.com>
        <20231025121725.46028-2-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

> -----Original Message-----
> From: Marek Szyprowski <m.szyprowski=40samsung.com>
> Sent: Wednesday, October 25, 2023 9:17 PM
> To: linux-samsung-soc=40vger.kernel.org; linux-i2c=40vger.kernel.org
> Cc: Marek Szyprowski <m.szyprowski=40samsung.com>; Krzysztof Kozlowski
> <krzysztof.kozlowski=40linaro.org>; Alim Akhtar <alim.akhtar=40samsung.co=
m>;
> Andi Shyti <andi.shyti=40kernel.org>; Wolfram Sang <wsa=40kernel.org>
> Subject: =5BPATCH v2 1/3=5D i2c: s3c24xx: fix read transfers in polling m=
ode
>=20
> To properly handle read transfers in polling mode, no waiting for the ACK
> state is needed as it will never come. Just wait a bit to ensure start
> state is on the bus and continue processing next bytes.
>=20
> Fixes: 117053f77a5a (=22i2c: s3c2410: Add polling mode support=22)
> Signed-off-by: Marek Szyprowski <m.szyprowski=40samsung.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c =7C 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-
> s3c2410.c
> index 127eb3805fac..f9dcb1112a61 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> =40=40 -216,8 +216,13 =40=40 static bool is_ack(struct s3c24xx_i2c *i2c)
>  	int tries;
>=20
>  	for (tries =3D 50; tries; --tries) =7B
> -		if (readl(i2c->regs + S3C2410_IICCON)
> -			& S3C2410_IICCON_IRQPEND) =7B
> +		unsigned long tmp =3D readl(i2c->regs + S3C2410_IICCON);
> +
> +		if (=21(tmp & S3C2410_IICCON_ACKEN)) =7B
> +			usleep_range(100, 200);

Trivial question, but is there any hardware specification related to sleepi=
ng for 100-200 microseconds? If any then it would be nice to use const vari=
able instead and add some description about why sleeping here is needed.

Thanks,
Inki Dae

> +			return true;
> +		=7D
> +		if (tmp & S3C2410_IICCON_IRQPEND) =7B
>  			if (=21(readl(i2c->regs + S3C2410_IICSTAT)
>  				& S3C2410_IICSTAT_LASTBIT))
>  				return true;
> --
> 2.34.1


