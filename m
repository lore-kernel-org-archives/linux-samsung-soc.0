Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201EACCA47F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 07:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237653AbiFGH3t (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237665AbiFGH3r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 03:29:47 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB912532DD
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 00:29:45 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220607072941epoutp0325d1cd0587984c0dba7f296e45121b61~2RhfFXjDG1126511265epoutp03m
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 07:29:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220607072941epoutp0325d1cd0587984c0dba7f296e45121b61~2RhfFXjDG1126511265epoutp03m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654586981;
        bh=j1WnS18PqFphWR7BASAq0cOIb7VLkVfVHpJqMSIeYQo=;
        h=From:To:Cc:Subject:Date:References:From;
        b=XxjafqiLwG+IPVOExQWux9pNdigFANv/9uj89gkNILxBEMN6Tr/8ibKT+4p6IRb7b
         FklngfmI4PO765irSlPcBaLIvNM4REgTbtaUQhGS0TmKRvIxocBUj3kGNqBrUaGHjV
         NypZ/9s7saLMCXATf/SvIqFJDkMqNTjnhgWzxZzU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220607072940epcas2p47d354a40afbe5d6cfd75b61af6a54eb9~2RheSXdDl1805918059epcas2p4d;
        Tue,  7 Jun 2022 07:29:40 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.69]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LHMSL6HgWz4x9Pr; Tue,  7 Jun
        2022 07:29:38 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        57.A0.09694.26EFE926; Tue,  7 Jun 2022 16:29:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220607072937epcas2p4e3e1bf3258e021c20692b0d348abdd8b~2RhcQ0HXS0598205982epcas2p4e;
        Tue,  7 Jun 2022 07:29:37 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220607072937epsmtrp29cc7b319551e4433fd28cfd31b50a99a~2RhcPtm242177421774epsmtrp2F;
        Tue,  7 Jun 2022 07:29:37 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-c6-629efe62cf1e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        DA.53.08924.16EFE926; Tue,  7 Jun 2022 16:29:37 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220607072937epsmtip1269c806c5ee74836e64ea18281ad886c~2RhcEfAL70442604426epsmtip1a;
        Tue,  7 Jun 2022 07:29:37 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v4 0/5] support secondary ufs for Exynos Auto v9 SoC
Date:   Tue,  7 Jun 2022 16:29:02 +0900
Message-Id: <20220607072907.127000-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmmW7Sv3lJBvfuGVk8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTM
        wFDX0NLCXEkhLzE31VbJxSdA1y0zB+g6JYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpB
        Sk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xvdXd1kKPvJW7Orza2Bs4O5i5OSQEDCRWDT9
        P2MXIxeHkMAORomHq+ZCOZ8YJdY938wG4XxmlFi1aTIbTEv/ugnMEIldjBKXL9yDqvrIKDFh
        zgFWkCo2AV2JLc9fgc0SEWhnkjhxby47iMMssJlR4uSEDcwgVcICLhIT/jWyg9gsAqoSh3uW
        gtm8AvYS+7Z+h9onL7Fhfi8zRFxQ4uTMJywgNjNQvHnrbLA7JAQ+skt8u/+CEaLBReLl6Y3M
        ELawxKvjW9ghbCmJz+/2Qg0tllg66xMTRHMD0BPbfkEljCVmPWsHGsQBtEFTYv0ufRBTQkBZ
        4sgtqL18Eh2H/7JDhHklOtqEIBrVJQ5sn84CYctKdM/5zAphe0g8/N8FdpmQQKxE/9kFjBMY
        5Wch+WYWkm9mIexdwMi8ilEstaA4Nz212KjABB6tyfm5mxjBSVTLYwfj7Lcf9A4xMnEwHmKU
        4GBWEuH1nzw3SYg3JbGyKrUoP76oNCe1+BCjKTB8JzJLiSbnA9N4Xkm8oYmlgYmZmaG5kamB
        uZI4r1fKhkQhgfTEktTs1NSC1CKYPiYOTqkGpm26Py/V+/YGvDkdL7uac6959TEDxZYU6cDk
        yrfbJ7UaCnwuX3r+7rSq3l+X5i9TZHO5tmdT3Rv+Q8F2EtdF0jgE9DiNGB2y/rw4u2H5FdXH
        ryquPPTSP1QzX8Lu/7YmxW+/ZF0+LD0hKq8rHnb5XIjuZ5Mgh0/WIRe4fQ64vevWLTzJ8m7d
        6S19DgFHLh7rsLnluquw6MzWV1l8i5KbFxZdmPFMQYp5rlu245U9vF/f9+9epL888Iir2IvH
        SQx5HF+j/+8JX+rWFulwPXvZeaEDAZPPuAQGLyqvk8i/rH9wwrOlr0XOPzZ/6P3vkaDlg9VO
        0W4m2f+eRfU9PNwhmbpngsIKBz+ptg8zYi/7rFNiKc5INNRiLipOBABotsZWKwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOLMWRmVeSWpSXmKPExsWy7bCSnG7iv3lJBjdfmlk8mLeNzeLyfm2L
        +UfOsVpceNrDZtH34iGzxd7XW9ktNj2+xmoxYdU3FosZ5/cxWbTuPcJusfPOCWYHbo9NqzrZ
        PO5c28PmsXlJvUffllWMHsdvbGfy+LxJLoAtissmJTUnsyy1SN8ugSvj+6u7LAUfeSt29fk1
        MDZwdzFyckgImEj0r5vA3MXIxSEksINR4uzffcwQCVmJZ+92sEPYwhL3W46wQhS9Z5SY/a+f
        DSTBJqArseX5K0aQhIhAN5PEnE39TCAOs8B2RokPS9exgFQJC7hITPjXCDaKRUBV4nDPUjCb
        V8BeYt/W72wQK+QlNszvZYaIC0qcnPkErJcZKN68dTbzBEa+WUhSs5CkFjAyrWKUTC0ozk3P
        LTYsMMpLLdcrTswtLs1L10vOz93ECA5rLa0djHtWfdA7xMjEwXiIUYKDWUmE13/y3CQh3pTE
        yqrUovz4otKc1OJDjNIcLErivBe6TsYLCaQnlqRmp6YWpBbBZJk4OKUamFyqm5pO/OUNsxc4
        Vnjl+aujX/3UXoTsF95+tj5fQO6uqbho7evL337OCRNyjHX4FBL0uGepsYv1+v5rib9ZD11I
        Pmf9Wfb+l+Unlu0J37zeQcxKvdwlqzlVrnTv85pSxroAV5vtW65E/lHr/7NM0XfWPtm6pq06
        jE6s9/MXBQtvKUuL0qv1T1vmEB1mEfHG0r/5/srbN9t+904MFb54+C+Hq+nCpw91nF402rYL
        e5YFcxS6fei1Pa82V3r797UFn+oDeztSPDYwhes+znYRtWx7wn35oVJspIh0+eVSLavM3ZkV
        0wsDDO+8mHP1pV1AUm0bY41PnNiGK27rFkV82HvovYx445FNvDH+m8OUWIozEg21mIuKEwE0
        zSeB2gIAAA==
X-CMS-MailID: 20220607072937epcas2p4e3e1bf3258e021c20692b0d348abdd8b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220607072937epcas2p4e3e1bf3258e021c20692b0d348abdd8b
References: <CGME20220607072937epcas2p4e3e1bf3258e021c20692b0d348abdd8b@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

To support ufs #1 for Exynos Auto v9 SoC, we need to control its own pmu
register. So, we need to specify the offset of the register via an
argument of syscon node.

Changes from v3:
- 0003: Apply array of const pointers and const data as suggested
  by Krzysztof
- Add Krzysztof's RB tags to all patches except 0003 patch.

Changes from v2:
- Exclude dts patchset because they'll be queued by Krzysztof after
  v5.19 merge window.
- 0001-dt-bindings: Add "maxItems: 1" to the first level pmu-syscon
  items as suggested by Krzysztof
- 0002: The patch has been added to clarify the variable name
- 0004: The patch has been added to remove drvdata pointer as suggested
  by Krzysztof

Changes from v1:
- dt-bindings: Correct tab align and add "minItems: 1" to make the second
  cell as optional.
- Add 0001- patch to constify phy_cfg.
- Allocate phy->isol and copy data from drvdata to avoid const qualifier
  error
- Add 0004- patch to apply dt style for ufs0 as Krzysztof's suggestion
- Align tab and apply ufs node naming for device tree nodes

Chanho Park (5):
  dt-bindings: phy: samsung,ufs-phy: make pmu-syscon as phandle-array
  phy: samsung: ufs: rename cfg to cfgs for clarification
  phy: samsung: ufs: constify samsung_ufs_phy_cfg
  phy: samsung: ufs: remove drvdata from struct samsung_ufs_phy
  phy: samsung: ufs: support secondary ufs phy

 .../bindings/phy/samsung,ufs-phy.yaml         | 14 ++++++++---
 drivers/phy/samsung/phy-exynos7-ufs.c         |  2 +-
 drivers/phy/samsung/phy-exynosautov9-ufs.c    |  2 +-
 drivers/phy/samsung/phy-samsung-ufs.c         | 18 ++++++++++-----
 drivers/phy/samsung/phy-samsung-ufs.h         | 23 +++++++++++--------
 5 files changed, 38 insertions(+), 21 deletions(-)

-- 
2.36.1

