From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: add DT binding for s3c2410 flash
 controller
Date: Mon, 10 Oct 2016 08:16:14 -0500
Message-ID: <20161010131614.GA7855@rob-hp-laptop>
References: <1475711217-974-1-git-send-email-sergio.prado@e-labworks.com>
 <1475711217-974-3-git-send-email-sergio.prado@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1475711217-974-3-git-send-email-sergio.prado@e-labworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, boris.brezillon@free-electrons.com, richard@nod.at, linux@armlinux.org.uk, krzk@kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, kgene@kernel.org, linux-mtd@lists.infradead.org, computersforpeace@gmail.com, dwmw2@infradead.org, linux@simtec.co.uk, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 05, 2016 at 08:46:56PM -0300, Sergio Prado wrote:
> Adds the device tree bindings description for Samsung S3C2410 and
> compatible NAND flash controller.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  .../devicetree/bindings/mtd/samsung-s3c2410.txt    | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt

Acked-by: Rob Herring <robh@kernel.org>
