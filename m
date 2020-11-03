Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3D7C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 09:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8B89223BD
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 09:51:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="P3mG97mX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgKCJv1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 04:51:27 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55801 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726058AbgKCJv0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 04:51:26 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201103095115euoutp029e2395512bf3389d1f673b15fb2eceee~D9qOqWaAh0378703787euoutp02V
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 09:51:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201103095115euoutp029e2395512bf3389d1f673b15fb2eceee~D9qOqWaAh0378703787euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604397075;
        bh=MnhYUgRiyVn2RU1Qy2Y4w9InTkQhtgs6BrcRHBGSfoM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=P3mG97mXQdN5hJ/jgvIht7ryV7s+5qFQafWhNin9cZNMu4OOXRnPSpwKus9bbAG0d
         I7K5eZJFvOzGisxXS3WhwQMNpUGFdQ7RGiDK9DZka/S8W4M8/V63MxGmF1AzliLbta
         AUmnliD/5N+EDCCF1X3jQSp1V5fXbvijaMV7RcmA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201103095109eucas1p2afb98fb92380eda0c5ebd4dfbb1b097d~D9qJ5E-1b2911529115eucas1p2a;
        Tue,  3 Nov 2020 09:51:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id EE.6A.06318.D0821AF5; Tue,  3
        Nov 2020 09:51:09 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201103095109eucas1p10f5c14bde52af8ecea147d4dac80f906~D9qJh0xKB3011530115eucas1p17;
        Tue,  3 Nov 2020 09:51:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201103095109eusmtrp1f768dc1ec1bcb83dd3c7f2214129cb4b~D9qJdR4YP1634016340eusmtrp1S;
        Tue,  3 Nov 2020 09:51:09 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-89-5fa1280d6e98
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id E2.60.06017.D0821AF5; Tue,  3
        Nov 2020 09:51:09 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201103095109eusmtip2062283a33ff507be950ec43d9dc2e29d~D9qJI7H4m3072330723eusmtip2T;
        Tue,  3 Nov 2020 09:51:09 +0000 (GMT)
Subject: Re: [PATCH 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
To:     Martin Juecker <martin.juecker@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <0af4946e-a573-ad5a-5558-de439d49434f@samsung.com>
Date:   Tue, 3 Nov 2020 10:51:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201102212118.GA2366@adroid>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djPc7q8GgvjDdY/MrWYf+Qcq0X/49fM
        FufPb2C3mHF+H5PFmX9TWRxYPXbOusvusWlVJ5vH501yAcxRXDYpqTmZZalF+nYJXBnbN7Uy
        FXzjrOhaf5ypgfEwexcjJ4eEgInEtbv3mLoYuTiEBFYwSqyesJINJCEk8IVR4vhraYjEZ0aJ
        Z9faWboYOcA6FlyFalgOFH/9jRHCec8oce7nDFaQbmGBQInnuz4ygdgiAmESKya9ZgJpZhYI
        ldj92wEkzCZgKNH1tgtsGa+AncSTL6vBWlkEVCR23FgKFhcVSJL4+/kPM0SNoMTJmU9YQGxO
        AW2JF69PM4LYzALyEtvfzmGGsMUlbj2ZD3achMBkdomzq5uZId50kVi36DorhC0s8er4Fqj3
        ZSROT+5hgWhoZpR4eG4tO4TTwyhxuWkGI0SVtcSdc7/YID7QlFi/Sx8i7Chx/edjdkio8Enc
        eCsIcQSfxKRt05khwrwSHW1CENVqErOOr4Nbe/DCJeYJjEqzkLw2C8k7s5C8Mwth7wJGllWM
        4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiBieX0v+NfdzDu+5N0iFGAg1GJh9chdUG8EGti
        WXFl7iFGCQ5mJRFep7On44R4UxIrq1KL8uOLSnNSiw8xSnOwKInzGi96GSskkJ5YkpqdmlqQ
        WgSTZeLglGpgLPbf+vHNj+AJxRrTQpW/hbCx3PyhIF8SqFgZ3a9qvfppcvqRW0Z6YXvm3Xc4
        3LNrV/yNfyG9MTIBPwTVe/oYjATXyte+28WsxCV36AvTpgMcu1L8b19sUvjBExPhcM1s7t6e
        0l25jIKiy+6cVqtLK4m3lGe/wpne1qZluDWsWi9e0ShgxmMlluKMREMt5qLiRACXeL/AKAMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xe7q8GgvjDZ41yFjMP3KO1aL/8Wtm
        i/PnN7BbzDi/j8nizL+pLA6sHjtn3WX32LSqk83j8ya5AOYoPZui/NKSVIWM/OISW6VoQwsj
        PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYztm1qZCr5xVnStP87UwHiYvYuRg0NC
        wERiwVWmLkYuDiGBpYwSc+51MHYxcgLFZSROTmtghbCFJf5c62KDKHrLKPFqwTt2kISwQKDE
        810fmUBsEYEwif1tnWDNzAKhEkumX2ABsYUEupkkZuzgA7HZBAwlut6CDOLk4BWwk3jyZTXY
        AhYBFYkdN5aCxUUFkiReXpjKBFEjKHFy5hOwOZwC2hIvXp+Gmm8mMW/zQ2YIW15i+9s5ULa4
        xK0n85kmMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7iREYS9uO
        /dyyg7HrXfAhRgEORiUeXofUBfFCrIllxZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUkt
        PsRoCvTcRGYp0eR8YJznlcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+Lg
        lGpgnHyBJSypfmm13ufGCQET+mXdDl5/8cJrv/ZKXfPXbOc3lFXfz3dbGuSufCVsW3d+VvV2
        41+XyvXZp91qEX4pYzY7K8SHe6H5nt7NL6aueTE/yN5708Xu20rmv71jH6+8rC9xff/ryH81
        b5WfPVdtLln0NO31yW3T+y/9PGQvriHzLdbwj5Z/vhJLcUaioRZzUXEiABTvj+a7AgAA
X-CMS-MailID: 20201103095109eucas1p10f5c14bde52af8ecea147d4dac80f906
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201102212129eucas1p1957c9dd5d6c1ebf7c340271a5e501c5b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201102212129eucas1p1957c9dd5d6c1ebf7c340271a5e501c5b
References: <20201031175836.47745-1-martin.juecker@gmail.com>
        <20201031175836.47745-3-martin.juecker@gmail.com>
        <20201102191845.GA64695@kozik-lap>
        <CGME20201102212129eucas1p1957c9dd5d6c1ebf7c340271a5e501c5b@eucas1p1.samsung.com>
        <20201102212118.GA2366@adroid>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Martin,

On 02.11.2020 22:21, Martin Juecker wrote:
> > ...
>>> +
>>> +&fimd {
>>> +	pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
>>> +	pinctrl-names = "default";
>>> +	status = "okay";
>>> +
>>> +	display-timings {
>>> +		timing0 {
>>> +			clock-frequency = <66666666>;
>>> +			hactive = <1280>;
>>> +			vactive = <800>;
>>> +			hfront-porch = <18>;
>>> +			hback-porch = <36>;
>>> +			hsync-len = <16>;
>>> +			vback-porch = <16>;
>>> +			vfront-porch = <4>;
>>> +			vsync-len = <3>;
>>> +			hsync-active = <1>;
>>> +		};
>>> +	};
>> What happened with Marek's comment about this?
>>
> Should have mentioned it in the introduction mail. I had a look at the
> simple panel driver and it's not enough for the display in the p4note. I
> asked Marek in IRC whether it's ok to have this in a separate patch set
> to have a fully working display and he agreed.

Yes, I agreed that the display can be added later in a separate patch. 
However in such case I would simply remove the whole fimd node now. 
Without a panel it is a bit useless imho. With a proper panel driver you 
will also get rid of the timings subnode, so there is no point adding it 
now.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

