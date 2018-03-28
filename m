From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCHv2] pinctrl: samsung: add pin_dbg_show callback for debugfs
Date: Wed, 28 Mar 2018 14:11:42 +0200
Message-ID: <61255506-cb75-3628-4ebb-7dec9d48219d@samsung.com>
References: <20180327135801.9556-1-parkch98@gmail.com>
 <CGME20180328121148epcas2p2a498fce663d34c8c3caf38e15d6e68c3@epcas2p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20180327135801.9556-1-parkch98@gmail.com>
Content-language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanho Park <parkch98@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 03/27/2018 03:58 PM, Chanho Park wrote:
> This patch adds a samsung_pin_dbg_show function to implement the
> pin_dbg_show callback function which can be used to show pin
> confuration values. Basically, it can show pin setting values by
> accessing the "pins" node like below:
> 
> $ cat pins
> pin 0 (gpy7-0)  CON(0x0) DAT(0x1) PUD(0x1) DRV(0x0) CON_PDN(0x0) PUD_PDN(0x0)
> 
> Signed-off-by: Chanho Park <parkch98@gmail.com>

Thank you for the patch. On exynos5433-tm2

Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
