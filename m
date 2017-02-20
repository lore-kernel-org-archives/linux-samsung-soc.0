From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/5] Fix the parse_dt of exynos dsi and remove the OF graph
Date: Mon, 20 Feb 2017 09:27:34 +0200
Message-ID: <CAJKOXPd7Roubdf_5B6pT1PkA9K9dZmjPydYOujXvrz8cVcKVmg@mail.gmail.com>
References: <CGME20170209012715epcas1p3dbe1788b864c50d339dcfd791c0900ec@epcas1p3.samsung.com>
 <1486603601-26826-1-git-send-email-hoegeun.kwon@samsung.com> <58AA95C1.4020809@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:43426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750861AbdBTH1j (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Feb 2017 02:27:39 -0500
In-Reply-To: <58AA95C1.4020809@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Mon, Feb 20, 2017 at 9:07 AM, Inki Dae <inki.dae@samsung.com> wrote:
> Hi Krzysztof,
>
> Can you merge patch 2 and 5 to your tree so that they can go to mainline? Otherwise, I can merge them to my tree if you give me acked-by.

Hi,

Hm? Why do you need them to be merged? Do you mean that the first
patch breaks not only ABI but also bisectability? Then this has to be
reworked because:

1. The DTS patches cannot go through non-DT tree so no, you cannot
take them into your branch. I will merge them according to point 4
below.
2. Bisectability has to be preserved.
3. DTS changes in general should not be a dependency for driver changes.
4 . Usually DTS patches wait for driver to be acked by devicetree
maintainers or merging by driver maintainer. This did not happen so
DTS patches wait. Also these were sent too late to merge for this
cycle so the only chance is v4.12.

Best regards,
Krzysztof
