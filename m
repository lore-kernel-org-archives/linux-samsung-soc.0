Return-Path: <SRS0=wFHd=2I=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCFAC43603
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Dec 2019 14:48:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85CA024676
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Dec 2019 14:48:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qSeVYGqN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbfLROsS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 18 Dec 2019 09:48:18 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59289 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbfLROsR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 09:48:17 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191218144815euoutp01bacee7d08b788ce5abac952f0002b14d~hfo6r3BBL3276532765euoutp01i
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2019 14:48:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191218144815euoutp01bacee7d08b788ce5abac952f0002b14d~hfo6r3BBL3276532765euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576680495;
        bh=1DgburzRei+7iW+6WARc7fUSzu/3gXW0bcDGkH57bSI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=qSeVYGqNpJ1LPdfN/xnasXYde4DNhGOsVrzJXqgyCB0T2sU2YOPCFNMaTKz0BScQ6
         SQkS6LAEpQxmNxku+4nvlSPtLf6de2k4BRYN1HpQodHgtmfaV/iTgtXjc6/eI0a5ss
         zPzo8xXbK5Eo15DfakbM+syB+WjzcgeL2DvCfsTU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191218144815eucas1p114627eac8bccd720497d0f807572031e~hfo6VX5H21269112691eucas1p1Y;
        Wed, 18 Dec 2019 14:48:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 38.3A.61286.F2C3AFD5; Wed, 18
        Dec 2019 14:48:15 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191218144814eucas1p22b7b58c28afb30e87730177c4b9ae101~hfo57dVDI0042100421eucas1p2H;
        Wed, 18 Dec 2019 14:48:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191218144814eusmtrp2a55c5ed864da215e210d5224f869d6bc~hfo564K6t2958629586eusmtrp2W;
        Wed, 18 Dec 2019 14:48:14 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-cd-5dfa3c2f0839
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.FF.08375.E2C3AFD5; Wed, 18
        Dec 2019 14:48:14 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191218144814eusmtip15579723234624cdbe685887f32977769~hfo5gCEfV2082520825eusmtip1_;
        Wed, 18 Dec 2019 14:48:14 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
To:     Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>
Cc:     ALSA development <alsa-devel@alsa-project.org>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Takashi Iwai <tiwai@suse.de>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
Date:   Wed, 18 Dec 2019 15:48:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218132620.GE3219@sirena.org.uk>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7r6Nr9iDXbOFLe4cvEQk8XUh0/Y
        LE4cbmS2aJ/ZwWhx/vwGdosZ5/cxWRx+085q8XLzGyaLPRdfsTtwemz43MTmsWBTqcemVZ1s
        Hn1bVjF6bD5d7fF5k1wAWxSXTUpqTmZZapG+XQJXxo0T29kLpvJUvLo6hb2B8QZnFyMHh4SA
        icSVKxVdjFwcQgIrGCVWX7rOCOF8YZTYcGk2K4TzmVHi9oIuIIcTrOPx6tMsEInljBIH/p1j
        h3DeMkrMXbaWDaRKWCBP4uCS1WC2iIC7xNF/O8A6mAU2MEk0dH0BS7AJGEp0ve0Cs3kF7CRe
        LbzACnIUi4CqRN9UZRBTVCBWomN5BkSFoMTJmU9YQMKcAkYSb18ng4SZBeQlmrfOZoawxSVu
        PZnPBLJJQuAYu8TWpnZGiKNdJO6v7mWDsIUlXh3fwg5hy0j83wnT0Mwo8fDcWnYIp4dR4nLT
        DKhua4nDxy+C3cYsoCmxfpc+RNhRYva9z8yQcOSTuPFWEOIIPolJ26ZDhXklOtqEIKrVJGYd
        Xwe39uCFS8wTGJVmIflsFpJ3ZiF5ZxbC3gWMLKsYxVNLi3PTU4sN81LL9YoTc4tL89L1kvNz
        NzECU9Ppf8c/7WD8einpEKMAB6MSD68Bw89YIdbEsuLK3EOMEhzMSiK8tzuAQrwpiZVVqUX5
        8UWlOanFhxilOViUxHmNF72MFRJITyxJzU5NLUgtgskycXBKNTAuMt4tyLnH+qGiQ+gyz8da
        ET/FJb1cfDgEXh78qDBHk+1le/qkxmW20xpmh3VIrOHZwnE3sOTnP4e3i6e7LzBq7ptbmXnD
        7H2Z57yUcznb/nPy31ty3/FoqMVBxQuLD3xSOPXk7YlPAY82xB4y3flCzdHpV2JzVlTh2tsl
        tx/duVGz8tC8xgmflFiKMxINtZiLihMBSwOjbkkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xu7p6Nr9iDZ6eMre4cvEQk8XUh0/Y
        LE4cbmS2aJ/ZwWhx/vwGdosZ5/cxWRx+085q8XLzGyaLPRdfsTtwemz43MTmsWBTqcemVZ1s
        Hn1bVjF6bD5d7fF5k1wAW5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
        TUpqTmZZapG+XYJexo0T29kLpvJUvLo6hb2B8QZnFyMnh4SAicTj1adZuhi5OIQEljJKPFt0
        kw0iISNxcloDK4QtLPHnWhcbRNFrRoknq5+zgySEBfIkDi5ZDdYgIuAucfTfDrBJzAIbmCT2
        T5nBDtEB5Gw9f5AZpIpNwFCi620XWAevgJ3Eq4UXgFZwcLAIqEr0TVUGCYsKxEp8X/mJEaJE
        UOLkzCcsICWcAkYSb18ng4SZBcwk5m1+yAxhy0s0b50NZYtL3Hoyn2kCo9AsJN2zkLTMQtIy
        C0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIHxuO3Yz807GC9tDD7EKMDBqMTDa8Dw
        M1aINbGsuDL3EKMEB7OSCO/tDqAQb0piZVVqUX58UWlOavEhRlOg1yYyS4km5wNTRV5JvKGp
        obmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsZudmnx4ylmu/4cXX3x3yZx
        zrXSa//93VbRVz8r7d9d76AAiy/1C05sWfH4hrW26t6+7O48AzWLlK1v/z34N/3k+fMvbj7i
        /rz19Z67x46FPa6+G3n9ULaur08uO5eSZoCd4f2kmpuN0sK2Be0Pz94yOFTyU2pKVHD9pVft
        HqU65/J3rnNkXXRTiaU4I9FQi7moOBEAuDwPcd0CAAA=
X-CMS-MailID: 20191218144814eucas1p22b7b58c28afb30e87730177c4b9ae101
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
        <20191128151908.180871-1-tzungbi@google.com>
        <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
        <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
        <20191218132620.GE3219@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Mark,

On 18.12.2019 14:26, Mark Brown wrote:
> On Fri, Dec 13, 2019 at 02:05:32AM +0800, Tzung-Bi Shih wrote:
>> I have no enough resources to test and trace the code temporarily.
>> But is it possible:
>> - snd_card_new( ) succeed in snd_soc_bind_card( ), so that userspace
>> can see the control
> This feels like snd_card_new() is being overly enthusiastic here, I'd
> expect that we might have other problems elsewhere with that.  I'd not
> expect userspace to see things until snd_card_register() since between
> _new() and that we're in the process of building the card up.  Given
> this we *will* need to handle partially constructed cards after all,
> unless we change the ALSA core.  Takashi?

I'm not sure if this is an issue about partially registered card. Here 
is the boot log:

https://paste.debian.net/1121543/

This oops happens when udev tries to do its job. The card is earlier 
fully registered and advertised by alsa:

[    3.501198] ALSA device list:
[    3.501300]   #0: Odroid-U3

If there are any useful logs for tracking this issue, let me know how to 
enable them, so I will provide more logs.

>
>> - code in later snd_soc_bind_card( ) decided to defer the probe
>> - soc_cleanup_card_resources( ) may forget to clean the control?  (not
>> sure about this)
> There's going to be a race condition where userspace can see the control
> on the partially built card regardless of if it gets cleaned up or not.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

