From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/4] soc: samsung: pm_domains for v4.11
Date: Tue, 07 Feb 2017 17:21:50 +0100
Message-ID: <1794934.k5K4JSs54W@wuerfel>
References: <20170202183008.23500-1-krzk@kernel.org>
 <20170202183008.23500-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170202183008.23500-2-krzk@kernel.org>
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

On Thursday, February 2, 2017 8:30:05 PM CET Krzysztof Kozlowski wrote:
> Improve the PM domains driver for Exynos by displaying a user-friendly name of
> power domain.  Till now, the name of node from DT was used which mostly is just
> "power-domain".  We need more than that.
> 

Pulled into next/drivers, thanks!

	Arnd
