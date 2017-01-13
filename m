From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 1/3] dt-bindings: Add support for samsung s6e3ha2
 panel binding
Date: Fri, 13 Jan 2017 11:29:14 -0600
Message-ID: <20170113172914.6qtxy5l5rwie5lrg@rob-hp-laptop>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063407epcas1p46379fc5062afe1268b186514969e225e@epcas1p4.samsung.com>
 <1484116439-7275-2-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:33676 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750713AbdAMR3W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Jan 2017 12:29:22 -0500
Content-Disposition: inline
In-Reply-To: <1484116439-7275-2-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: krzk@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, a.hajda@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, andi.shyti@samsung.com, Donghwa Lee <dh09.lee@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>

On Wed, Jan 11, 2017 at 03:33:57PM +0900, Hoegeun Kwon wrote:
> The Samsung s6e3ha2 is a 5.7" 1440x2560 AMOLED panel connected
> using MIPI-DSI interfaces.
> 
> Signed-off-by: Donghwa Lee <dh09.lee@samsung.com>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  .../bindings/display/panel/samsung,s6e3ha2.txt     | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt

Acked-by: Rob Herring <robh@kernel.org>
