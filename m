From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: MCPM: Add provision for platform specific wfi
 alternative
Date: Mon, 11 Feb 2019 14:12:41 +0000
Message-ID: <20190211141241.vcz64as6wqdhfrmb@shell.armlinux.org.uk>
References: <20190210231212.20470-1-stuart.menefy@mathembedded.com>
 <CAPoDyq6vzXuR+Z=t9eyJytuOGZknyY1nOY7v_ir86VTZM3DH5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAPoDyq6vzXuR+Z=t9eyJytuOGZknyY1nOY7v_ir86VTZM3DH5g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stuart Menefy <stuart.menefy@mathembedded.com>
Cc: linux-samsung-soc@vger.kernel.org, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 11, 2019 at 01:53:14PM +0000, Stuart Menefy wrote:
> Folks
> 
> On Sun, 10 Feb 2019 at 23:12, Stuart Menefy
> <stuart.menefy@mathembedded.com> wrote:
> >
> > On some platforms (in particular the Exynos5260) the wfi is not
> > executed directly by the operating system but by trapping into the
> > secure monitor. This allows us to replicate the behaviour of the
> > vendor supplied kernel using the MCPM framework.
> >
> > Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
> 
> I forgot to add, this is a part of a series of patches which updates
> the Exynos 5260
> support, allowing use of the kernel on secure parts and adding suspend
> functionality,
> Version 1 of the patches has been posted to the samsung-soc mailing list:
> https://www.spinics.net/lists/linux-samsung-soc/#65035
> and I'm just about to post version 2. However as this is the only patch which
> touches generic ARM files I though I'd better check the approach is acceptable
> to a wider audience.

Please don't limit patches to just the SoC specific mailing list - copy
linux-arm-kernel and linux-kernel as well.  Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
