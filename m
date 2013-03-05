From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] dma: of-dma: return error when 'dma-cells' not found
Date: Tue, 05 Mar 2013 11:15:41 +0100
Message-ID: <1859273.NY466Orvuh@wuerfel>
References: <1362475531-32260-1-git-send-email-padma.v@samsung.com>
 <5135BE58.4040105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5135BE58.4040105-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, boojin.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 05 March 2013 03:43:52 Rob Herring wrote:
> On 03/05/2013 03:25 AM, Padmavathi Venna wrote:
> > This patch returns error when 'dma-cells' property not found
> > in the corresponding device node. With out this change there
> > is a crash in the generic dma incompatible platforms.
> > 
> > Signed-off-by: Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> NAK.
> 
> #dma-cells should be optional. It is not needed for platforms supporting
> memory to memory transfers only and should therefore be optional. You
> cannot assume the dtb can be updated and kernel changes need to work
> with old dtbs. I've submitted patches to address this and fix the crash:
> 
> https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-February/028769.html

Why would you call of_dma_controller_register() for a dma
engine that does not support slave channels, when that is the
only purpose of that interface?

Note that the binding defines #dma-cells as required, and it
does not make any sense otherwise.

	Arnd
