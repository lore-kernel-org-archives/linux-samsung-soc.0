Return-Path: <SRS0=f9pd=5D=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8480CC2BB1D
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Mar 2020 03:12:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5006B20752
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Mar 2020 03:12:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hvHq4hh1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgCRDMW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Mar 2020 23:12:22 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:48763 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgCRDMW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Mar 2020 23:12:22 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20200318031220epoutp01367c51275a1bd791c2e4457ab78bb5cd~9R2RkKA8J1498914989epoutp01X
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Mar 2020 03:12:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20200318031220epoutp01367c51275a1bd791c2e4457ab78bb5cd~9R2RkKA8J1498914989epoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1584501140;
        bh=4xX9NivP9RedFKlnTL4lk+r9c8gUmHHDv5lvT9UCc00=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=hvHq4hh1Q3tQ2Vcqwb8xRarbP1F6kajbK2HKXpLMT+wDLF0b59dbUYPC3yBZ469Hg
         MpVeeQP/Sr09tTG3uQiQjbatoLYkh4ueNGc/9uDp9QR4gVZ6itPGYiAq6T+3frXyX5
         VPXfv8EwMaVYJ03i2iMWVpogxtF9njsVCMNpGixg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20200318031220epcas1p48b55eb7df700eed739da1d3fde765db6~9R2RWb73X2842328423epcas1p4r;
        Wed, 18 Mar 2020 03:12:20 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 48hw7j0HY3zMqYkV; Wed, 18 Mar
        2020 03:12:17 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        F0.89.04145.091917E5; Wed, 18 Mar 2020 12:12:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200318031216epcas1p102e1519db5bd502f4ef9c5748db30922~9R2N-TWYy2081020810epcas1p1N;
        Wed, 18 Mar 2020 03:12:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200318031216epsmtrp12d97ed2e8c15c49a9155f18adee9535c~9R2N_lFX51700717007epsmtrp1L;
        Wed, 18 Mar 2020 03:12:16 +0000 (GMT)
X-AuditID: b6c32a35-28dff70000001031-21-5e719190b8b9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        36.01.04024.091917E5; Wed, 18 Mar 2020 12:12:16 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200318031216epsmtip1f6775704cab3c0a8ccc20fae17f2e918~9R2NxsJD70198001980epsmtip1b;
        Wed, 18 Mar 2020 03:12:16 +0000 (GMT)
Subject: Re: [GIT PULL] exynos-drm-next
To:     Dave Airlie <airlied@gmail.com>
Cc:     Dave Airlie <airlied@linux.ie>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <ffdb2c6b-b2cb-958e-17fb-5fe6b0c6241d@samsung.com>
Date:   Wed, 18 Mar 2020 12:16:53 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9tzrQM4CiFNZDmyDFLC7ODyZVD-O9vmiJw4myPmz3HoAEA@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+917t13DxW1anuy1bkQozXa12SytwKhFQooFFbF1cZdtuMd1
        dxsZFkZUZkkte9jKR1YSRS8zH5FWi1IRSkGd9BR60IOykglaaJvXyP8+55zv4XvO73dIXHFC
        Gkta7C7OaWettHQqUf84Tq3yevP06kN52rZANaYtedaOabuDA1Jt2fMWbA2ha/K9lukahvol
        urdHWjHdYO28TGJ7bqqZY42cU8nZcxxGi92URm/MNqQbNMlqRsWkaJfTSjtr49LotRmZqnUW
        a8iRVnpYqzuUymQFgV66KtXpcLs4pdkhuNJojjda+RQ+QWBtgttuSshx2FYwanWiJiTcmWse
        GD6M8dWzdlVffyQrRJ3RxSiCBGoZ3Pg2ghWjqaSCakRw/NUfiRj8QlBX+GoiGELQ2/ME+9dS
        +uQaLhaaEYyVPCTEYADBja8f8bAqiloMZ05+GudoaiF8ePxbFhbhVDGCmq4PKFyQUovAe+Wt
        NMxyahUMXyiThJkI5c+2DobsSHIGtRU6gqwomQ7tZ98TYY6gsmBfX4UszDgVAy/eV2Iiz4f9
        d8+NTwdUmxSuBRuQOPZaaPbfnuAo+NJaJxM5Fj4fOygTG/Yj8JZ1YGJQhOD1uwAhqpLgweXS
        8YlwKg5u3lsqphdA0+9yJDpPg+/Bo5KwBCg5FB1UiBIannb1TfgCdF7ySkXWQWX/A+w4WuCb
        tJtv0j6+Sfv4/htXIeIqmsnxgs3ECQzPTP7vWjR+j/GaRnTyWYYfUSSiI+XkLV6vkLAeId/m
        R0DidLT8Yp5Dr5Ab2fzdnNNhcLqtnOBHmtDLe/HYGTmO0HXbXQZGk5iUlKRdxiRrGIaOkZ8K
        WPUKysS6uFyO4znnvz6MjIgtRC0Vwcq9R5/eOZGVkqx6lFqSUKTtbJLlMPGbo0dn1xwYrOpQ
        LjdtSK3qbuNfEs0Wz5rI9p+XW3oNqh89m+tnjfwZXaL+en+lZgrS+xrSr1fljpWT2QXp/Z9G
        jOc3VUT27ghkd2nmJ673zM0/LVu9h0MF1ByzpzSwBS5a3qiHt2XThGBmmXjcKbB/AfBpR0Cl
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsWy7bCSnO6EiYVxBr0fZSxOXF/EZNF77iST
        xZWv79ksZpzfx+TA4rFz1l12j+3fHrB63O8+zuTxeZNcAEsUl01Kak5mWWqRvl0CV8b7n51M
        BYskKxatPcjewHhBpIuRk0NCwERi8tHVzF2MXBxCArsZJbpf/WDrYuQASkhIbNnKAWEKSxw+
        XAxR8pZR4uKOLnaQXmEBdYnpU14wg9giAsoSTw//ZgcpYhboYpRoeXySBaLjHqPEmd3bGEGq
        2ARUJSauuM8GYvMK2En8XDiDFcRmAYrPPP6ZCcQWFYiQeL79BiNEjaDEyZlPWEBsToFAicYb
        88A2MwNt/jPvEjOELS5x68l8JghbXqJ562zmCYxCs5C0z0LSMgtJyywkLQsYWVYxSqYWFOem
        5xYbFhjmpZbrFSfmFpfmpesl5+duYgTHg5bmDsbLS+IPMQpwMCrx8CZsKogTYk0sK67MPcQo
        wcGsJMK7uDA/Tog3JbGyKrUoP76oNCe1+BCjNAeLkjjv07xjkUIC6YklqdmpqQWpRTBZJg5O
        qQbGfh3z2fOePg0WTDIREtjstGgpx7wKEa/lWUX9fe8u8+19KXbm7oboqpcHlLYu2i14TsuJ
        +abwlwMJPXXvzB12W0fqz9IV9k3itszT7TLqEXER/3czJb19wuMAjtCFCms09MtEsrcdX3Rl
        daZu38sTb7asnjjx45zE/NgvD/zmn1u7xfHZ/opYJZbijERDLeai4kQAUpoKKIMCAAA=
X-CMS-MailID: 20200318031216epcas1p102e1519db5bd502f4ef9c5748db30922
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d
References: <CGME20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d@epcas1p3.samsung.com>
        <1584320957-9442-1-git-send-email-inki.dae@samsung.com>
        <CAPM=9tzrQM4CiFNZDmyDFLC7ODyZVD-O9vmiJw4myPmz3HoAEA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

20. 3. 18. 오전 11:17에 Dave Airlie 이(가) 쓴 글:
> This seems to contain a exynos drm fixes backmerge, please don't do
> that without a headsup.
> 
> Can you send one without that or do you need a fixes backmerge, if so
> please request me to do that first, then rebase this and send it.

Sorry for confusing you. Dropped the backmerge from exynos drm fixes and pushed it again.
Please let me know if there is any problem.

Thanks,
Inki Dae

> 
> Dave.
> 
> On Mon, 16 Mar 2020 at 11:04, Inki Dae <inki.dae@samsung.com> wrote:
>>
>>         Just two cleanups - one is to mask encoder bitmask using
>>         drm_encoder_mask(), and other is to use mode->clock
>>         instead of calculating it again.
>>
>>         Please kindly let me know if there is any problem.
>>
>> Thanks,
>> Inki Dae
>>
>> The following changes since commit 69ddce0970d9d1de63bed9c24eefa0814db29a5a:
>>
>>   Merge tag 'amd-drm-next-5.7-2020-03-10' of git://people.freedesktop.org/~agd5f/linux into drm-next (2020-03-13 09:09:11 +1000)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.7
>>
>> for you to fetch changes up to 0c9a609ca444298e438ee9c6daaf53c14277f1ad:
>>
>>   drm/exynos: Use mode->clock instead of reverse calculating it from the vrefresh (2020-03-16 09:50:28 +0900)
>>
>> ----------------------------------------------------------------
>> Two cleanups
>> . Replace the hand rolled encoder bitmask thing with drm_encoder_mask()
>> . Use mode->clock instead of reverse calculating it from the vrefresh
>>
>> ----------------------------------------------------------------
>> Inki Dae (1):
>>       Merge tag 'exynos-drm-fixes-for-v5.6-rc5-v2' of git://git.kernel.org/.../daeinki/drm-exynos into exynos-drm-next
>>
>> Marek Szyprowski (1):
>>       drm/exynos: Fix cleanup of IOMMU related objects
>>
>> Ville Syrjälä (2):
>>       drm/exynos: Use drm_encoder_mask()
>>       drm/exynos: Use mode->clock instead of reverse calculating it from the vrefresh
>>
>>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 +++--
>>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  7 ++++---
>>  drivers/gpu/drm/exynos/exynos_drm_dma.c       | 28 ++++++++++++++++++---------
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c       |  5 ++---
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |  6 ++++--
>>  drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  5 +++--
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  5 +++--
>>  drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  5 +++--
>>  drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  5 +++--
>>  drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  5 +++--
>>  drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 ++++--
>>  drivers/gpu/drm/exynos/exynos_mixer.c         |  7 +++++--
>>  12 files changed, 56 insertions(+), 33 deletions(-)
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://protect2.fireeye.com/url?k=2f99e96f-720f5018-2f986220-0cc47a312ab0-6a58a038adb2e152&u=https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
