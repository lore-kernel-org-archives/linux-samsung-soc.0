From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] drm/exynos/dsi: Remove error handling for bridge_node
 DT parsing
Date: Wed, 21 Jun 2017 08:35:25 +0200
Message-ID: <CAJKOXPecr9RvAKb6EvfZRmf8UPenRLAqF6_B6DzamNEVbmCmpw@mail.gmail.com>
References: <CGME20170621063347epcas1p46d2ccf5edbedc5386222c0fce3b2523a@epcas1p4.samsung.com>
 <1498026812-18539-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751069AbdFUGf1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 02:35:27 -0400
In-Reply-To: <1498026812-18539-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, jy0922.shim@samsung.com, Seung Woo Kim <sw0312.kim@samsung.com>, airlied@linux.ie, kgene@kernel.org, javier@osg.samsung.com, a.hajda@samsung.com, tjakobi@math.uni-bielefeld.de, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 21, 2017 at 8:33 AM, Hoegeun Kwon <hoegeun.kwon@samsung.com> wrote:
> Remove the error handling of bridge_node because the bridge_node is
> optionally.

"is optional"

>
> For example, In case of Exynos SoC, a bridge device such as mDNIe and
> MIC could be placed between Display Controller and MIPI DSI device but
> the bridge device is optionally.

Ditto.

BR,
Krzysztof
