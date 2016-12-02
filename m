From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/3] ARM: exynos: Soc/mach for v4.10
Date: Fri, 02 Dec 2016 22:52:57 +0100
Message-ID: <57568492.9hbg5JCdec@wuerfel>
References: <1479967709-6619-1-git-send-email-krzk@kernel.org>
 <1479967709-6619-2-git-send-email-krzk@kernel.org>
 <20161201183404.GA2134@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161201183404.GA2134@kozik-lap>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday, December 1, 2016 8:34:04 PM CET Krzysztof Kozlowski wrote:
> On Thu, Nov 24, 2016 at 08:08:27AM +0200, Krzysztof Kozlowski wrote:
> > Hi,
> > 
> > This contains previous dts branch because SCU node in dts is needed
> > prior to removing it from mach code.
> > 
> > Below you will find full pull request and one stripped from dependency.
> > 
> 
> Hi Arnd, Kevin and Olof,
> 
> What about this pull from the set?
> 

Sorry, I initially deferred it and then didn't get back to it.

The dependency on the .dts changes made me a bit nervous about
taking it, mostly because the changelog fails to explain the
exact dependencies.

This breaks compatibility with existing .dtb files, right?
What I'd like to see here is an explanation about:

- what the upside of breaking compatibility is
- what exactly stops working with an old dtb
- why we don't keep a fallback for handling old dtb files

It would also be helpful to have a separate pull request for
the commits require the new dtb, and the stuff that is unrelated.

	Arnd
