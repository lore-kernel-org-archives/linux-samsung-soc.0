From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 3/3] ARM: dts: exynos: pinctrl cleanup for v4.9
Date: Mon, 19 Sep 2016 17:48:12 +0200
Message-ID: <3076399.mIVbMOx8e1@wuerfel>
References: <1474216788-17282-1-git-send-email-krzk@kernel.org>
 <1474216788-17282-4-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1474216788-17282-4-git-send-email-krzk@kernel.org>
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
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sunday, September 18, 2016 6:39:48 PM CEST Krzysztof Kozlowski wrote:
> Topic branch for Samsung DeviceTree cleanup for 4.9.
> 
> Replace in DT sources hard-coded values for pinctrl configuration like pull
> up/down, drive strength and function. This makes the DTS easier to read,
> especially that some drive strengths values are quite non-obvious.
> 
> 

Pulled into next/dt, thanks!

	Arnd
