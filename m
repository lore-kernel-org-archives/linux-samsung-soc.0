From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: mtd: add DT binding for s3c2410
 flash controller
Date: Wed, 26 Oct 2016 18:19:12 -0500
Message-ID: <20161026231912.z6yez3posjqkqtxu@rob-hp-laptop>
References: <1476999766-32526-1-git-send-email-sergio.prado@e-labworks.com>
 <1476999766-32526-3-git-send-email-sergio.prado@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:35213 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754307AbcJZXTO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Oct 2016 19:19:14 -0400
Content-Disposition: inline
In-Reply-To: <1476999766-32526-3-git-send-email-sergio.prado@e-labworks.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, linux@armlinux.org.uk, linux@simtec.co.uk, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, mark.rutland@arm.com, devicetree@vger.kernel.org

On Thu, Oct 20, 2016 at 07:42:45PM -0200, Sergio Prado wrote:
> Adds the device tree bindings description for Samsung S3C2410 and
> compatible NAND flash controller.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  .../devicetree/bindings/mtd/samsung-s3c2410.txt    | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt

Acked-by: Rob Herring <robh@kernel.org>
