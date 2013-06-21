From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V10 0/4] PCIe support for Samsung Exynos5440 SoC
Date: Fri, 21 Jun 2013 09:31:58 +0200
Message-ID: <201306210931.58428.arnd@arndb.de>
References: <003901ce6e50$03d039a0$0b70ace0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <003901ce6e50$03d039a0$0b70ace0$@samsung.com>
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
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: 'Jason Gunthorpe' <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Siva Reddy Kallam' <siva.kallam-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Surendranath Gurivireddy Balla' <suren.reddy-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, 'Thierry Reding' <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Mohit KUMAR' <Mohit.KUMAR-qxv4g6HH51o@public.gmane.org>, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, 'Andrew Murray' <andrew.murray-5wv7dgnIgG8@public.gmane.org>, 'Pratyush Anand' <pratyush.anand-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 21 June 2013, Jingoo Han wrote:
> Changes between v9 and v10:
>   * Changed the file name from 'pci-designware.c' to 'pcie-designware.c'
>     guided by Pratyush Anand, because synopsis pcie and pci controllers
>     are different.
>   * Fixed the typos of document, reported by Sachin Kamat.
> 
> Changes between v8 and v9:
>   * Changed the file name from 'exynos-pcie.txt' to 'designware-pcie.txt'.
>   * Added 'snps,dw-pcie' string to compatible property.
> 
> Changes between v7 and v8:
>   * Changed the file name from 'pci-exynos.c' to 'pci-designware.c',
>     and added a generic string for compatible property to exynos-pcie.txt
>   * Moved pci_add_resource_offset() for I/O space to the 'if' clause
>   * Added Arnd's Acked-by
> 
> Changes between v6 and v7:
>   * Split ARM DT patch to two patches
>   * Fixed node naming
>   * Added Arnd's Acked-by

Ok, that takes care of all my comments.

Bjorn, are you still considering to merge this for 3.11 or have you
closed your tree for the merge window? I think it would be good to get
it in.

	Arnd
