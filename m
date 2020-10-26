Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332ACC388F9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 05:32:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4CBD2087C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 05:32:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="F3O49Iaw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1768868AbgJZFcr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 01:32:47 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:39232 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1768869AbgJZFcq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 01:32:46 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20201026053242epoutp01072741cb3767a21496614775851404cc~Bc_NneXMv0789907899epoutp01Z
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2020 05:32:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20201026053242epoutp01072741cb3767a21496614775851404cc~Bc_NneXMv0789907899epoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603690362;
        bh=Xf9YaH5Y5eh9HJzLFW03RhhfJZQBOHOWIOe0XC3xzo4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=F3O49Iaw3S2j8JqaXPhXyXPqriHcHwsLYcDYg45SMl2UJHgUWf51Lh6r53Bmtukxj
         XfokWsKUpkgu56D9hdtZ2WbIdSE4pCwYjaTZBcx0nWF4DPRbWMDSJE+25M8ggqUZ09
         7CgLAqD0trIPNo6azYOAotb23YgVShFOqHl68niw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201026053242epcas1p2fd5d4e03c94ab84af527e3f46ed52b28~Bc_NEM6vA1160511605epcas1p2-;
        Mon, 26 Oct 2020 05:32:42 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.152]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4CKNlD0gS7zMqYkh; Mon, 26 Oct
        2020 05:32:40 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        F6.02.09582.47F569F5; Mon, 26 Oct 2020 14:32:36 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20201026053235epcas1p3fc6aafa2a1e33066b70535824385b0c7~Bc_GzZFmj0633206332epcas1p3S;
        Mon, 26 Oct 2020 05:32:35 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201026053235epsmtrp27ea959520b7960279ad2768d0a4af03c~Bc_GyrEhM0177401774epsmtrp2x;
        Mon, 26 Oct 2020 05:32:35 +0000 (GMT)
X-AuditID: b6c32a37-899ff7000000256e-6d-5f965f741a71
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4D.D4.08745.37F569F5; Mon, 26 Oct 2020 14:32:35 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201026053235epsmtip2184f98d87a9a3c0045043aa06d1285a2~Bc_GlRiKt2730627306epsmtip2D;
        Mon, 26 Oct 2020 05:32:35 +0000 (GMT)
Subject: Re: [PATCH] clk: exynos7: Mark aclk_fsys1_200 as critical
To:     =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        kgene@kernel.org, krzk@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <56fb4ede-e81a-5721-1927-77f2410d5885@samsung.com>
Date:   Mon, 26 Oct 2020 14:46:24 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201024154346.9589-1-pawel.mikolaj.chmiel@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmvm5J/LR4g533uC36H79mtjh/fgO7
        xabH11gtPvbcY7W4vGsOm8WM8/uYLC6ecrX4cbyP2eLwm3ZWi3/XNrJYrNr1h9GB2+P9jVZ2
        j52z7rJ7bFrVyeaxeUm9R9+WVYwenzfJBbBFZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZ
        GOoaWlqYKynkJeam2iq5+AToumXmAF2npFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1I
        ySmwLNArTswtLs1L10vOz7UyNDAwMgUqTMjOaGzdxVrwgL/i3OqEBsYW3i5GTg4JAROJGbc/
        MXYxcnEICexglHh/6QwzSEJI4BOjRN/kCIjEZ0aJ5tmPmLoYOcA6Hk6UhIjvYpR4vvsLVMN7
        RokJDVUgtrCAk8ThxfdYQIpEBCYxSvx98JoVxGEW2M4osenONnaQKjYBLYn9L26wgdj8AooS
        V388ZgSxeQXsJNo/3GcCsVkEVCU6e4+zgtiiAmESJ7e1QNUISpyc+YQFxOYUcJb4smsKWD2z
        gLjErSfzoWx5ieats5lBFksIHOCQaPmxkgniaReJkz/+MkPYwhKvjm9hh7ClJD6/28sGYVdL
        rDx5hA2iuYNRYsv+C6wQCWOJ/Usng8OCWUBTYv0ufYiwosTO33MZIRbzSbz72sMKCS5eiY42
        IYgSZYnLD+5CnSApsbi9k20Co9IsJO/MQvLCLCQvzEJYtoCRZRWjWGpBcW56arFhgTFyZG9i
        BCdcLfMdjNPeftA7xMjEwXiIUYKDWUmEd47M1Hgh3pTEyqrUovz4otKc1OJDjKbAAJ7ILCWa
        nA9M+Xkl8YamRsbGxhYmhmamhoZK4rx/tDvihQTSE0tSs1NTC1KLYPqYODilGph8xcxcfht7
        qr71Z7xwYoLdDHHFoPR19yM8dyRq+Hzp/yr/Nvjd3iotMRalH/vntb5kUueM+BI+5xq70aqJ
        sab5IQHdM0MnGsVxHczs4rqz7VPw05fXHKJKeJr+X3imeXGrbqYjn8N2uZaE93f4muxtLl++
        z5yY6K/b5XNCodNh3gpPJf6J57mWxMg+v6P7c97LEj7H2WI3GV7N6J0x8xObavbJiVVbF4qe
        v7ydLU1G2cNe++EOl3/rZ/XsWNOT9OXY67y13daPUw9P8hVq6+l4t9uq++8nAUcpzpW9Sw1C
        Zn9TTGSuvNUi69L8+vn6bi4lqdWh/ydmSwU+2JU5+fV9rh1G970KWLPMSqU37FViKc5INNRi
        LipOBAA6pPrsQQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsWy7bCSvG5x/LR4g923pCz6H79mtjh/fgO7
        xabH11gtPvbcY7W4vGsOm8WM8/uYLC6ecrX4cbyP2eLwm3ZWi3/XNrJYrNr1h9GB2+P9jVZ2
        j52z7rJ7bFrVyeaxeUm9R9+WVYwenzfJBbBFcdmkpOZklqUW6dslcGU0tu5iLXjAX3FudUID
        YwtvFyMHh4SAicTDiZJdjFwcQgI7GCVeX33I2sXICRSXlJh28SgzRI2wxOHDxRA1bxklNu95
        yAhSIyzgJHF48T0WkISIwCRGiU8fO9lBHGaB7YwSXw8eYAKpEhKYxijRv9UMxGYT0JLY/+IG
        G4jNL6AocfXHY7BJvAJ2Eu0f7oPVswioSnT2Hge7QlQgTGLnksdMEDWCEidnPmEBsTkFnCW+
        7JoCFmcWUJf4M+8SM4QtLnHryXyouLxE89bZzBMYhWchaZ+FpGUWkpZZSFoWMLKsYpRMLSjO
        Tc8tNiwwykst1ytOzC0uzUvXS87P3cQIjj0trR2Me1Z90DvEyMTBeIhRgoNZSYR3jszUeCHe
        lMTKqtSi/Pii0pzU4kOM0hwsSuK8X2ctjBMSSE8sSc1OTS1ILYLJMnFwSjUwNcx0yTk29Uwz
        p9wy2a88dgE77O9VqXnLGl5ZVft7tbXaT1PjSz9N1/rnxr9Ynv8608rylPoCTqVSx9aG3y87
        p7YuX/ryVWjWKqXoHuEFzzZEfZg63zGUJ/Lgoqz5x1fyuDsdtpaeLaYZH8YcOaVpe0d+2Zlz
        zlZ5ejVbQqaFiO54ZR6gzSB0at0NFYO6lrD9iYdZYxcbW6xI/elvsal+l3bz3e9TVrFIFif+
        XH5ixktmqZcTC55z7+5xqWlcbu6U+59306NL1rbe51W+eWlaJghHx5+YanHK4pMNW8p36xzX
        E1+vPTBjYluS8dJFdfKdfS67D4reM3nZ9T18fTz/H7HLuxbeOMypksm0W9pciaU4I9FQi7mo
        OBEAA8zKtiwDAAA=
X-CMS-MailID: 20201026053235epcas1p3fc6aafa2a1e33066b70535824385b0c7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201024154433epcas1p3e6cbd7855e24cb5798026134e61c05b1
References: <CGME20201024154433epcas1p3e6cbd7855e24cb5798026134e61c05b1@epcas1p3.samsung.com>
        <20201024154346.9589-1-pawel.mikolaj.chmiel@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Paweł Chmiel,

On 10/25/20 12:43 AM, Paweł Chmiel wrote:
> This clock must be always enabled to allow access to any registers in
> fsys1 CMU. Until proper solution based on runtime PM is applied
> (similar to what was done for Exynos5433), mark that clock as critical
> so it won't be disabled.
> 
> It was observed on Samsung Galaxy S6 device (based on Exynos7420), where
> UFS module is probed before pmic used to power that device.
> In this case defer probe was happening and that clock was disabled by
> UFS driver, causing whole boot to hang on next CMU access.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
> index c1ff715e960c..1048d83f097b 100644
> --- a/drivers/clk/samsung/clk-exynos7.c
> +++ b/drivers/clk/samsung/clk-exynos7.c
> @@ -538,7 +538,8 @@ static const struct samsung_gate_clock top1_gate_clks[] __initconst = {
>  		ENABLE_ACLK_TOP13, 28, CLK_SET_RATE_PARENT |
>  		CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK_FSYS1_200, "aclk_fsys1_200", "dout_aclk_fsys1_200",
> -		ENABLE_ACLK_TOP13, 24, CLK_SET_RATE_PARENT, 0),
> +		ENABLE_ACLK_TOP13, 24, CLK_SET_RATE_PARENT |
> +		CLK_IS_CRITICAL, 0),

As you commented, in order to keep the always on state,
we can use CLK_IS_CRITICAL. Instead, you can enable the specific clock
with detailed comment on clk-exynos7.c as following merged patches[1][2]:
[1] 67f96ff7c8f0 ("clk: samsung: exynos5420: Keep top G3D clocks enabled")
[2] 0212a0483b0a ("clk: samsung: Keep top BPLL mux on Exynos542x enabled")

The patches[1][2] enable the clock with clk_prepare_enable()
instead of adding CLK_IS_CRITICAL. You can refer to it.

>  
>  	GATE(CLK_SCLK_PHY_FSYS1_26M, "sclk_phy_fsys1_26m",
>  		"dout_sclk_phy_fsys1_26m", ENABLE_SCLK_TOP1_FSYS11,
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
