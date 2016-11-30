From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: add DT binding for s3c2410 USB
 OHCI controller
Date: Wed, 30 Nov 2016 15:53:31 -0600
Message-ID: <20161130215331.v3mcm4zyojlagynz@rob-hp-laptop>
References: <1480085249-25014-1-git-send-email-sergio.prado@e-labworks.com>
 <1480085249-25014-2-git-send-email-sergio.prado@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1480085249-25014-2-git-send-email-sergio.prado@e-labworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, stern@rowland.harvard.edu, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Nov 25, 2016 at 12:47:28PM -0200, Sergio Prado wrote:
> Adds the device tree bindings description for Samsung S3C2410 and
> compatible USB OHCI controller.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  .../devicetree/bindings/usb/s3c2410-usb.txt        | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/s3c2410-usb.txt

Acked-by: Rob Herring <robh@kernel.org>
