From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv2] pinctrl: samsung: add pin_dbg_show callback for debugfs
Date: Thu, 12 Apr 2018 10:14:38 +0200
Message-ID: <CACRpkdaudDZ4H_t-bWzuFOLU6bxCrV=DOLisO1Jw=ufg9e2Bkw@mail.gmail.com>
References: <20180327135801.9556-1-parkch98@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180327135801.9556-1-parkch98@gmail.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Mar 27, 2018 at 3:58 PM, Chanho Park <parkch98@gmail.com> wrote:

> This patch adds a samsung_pin_dbg_show function to implement the
> pin_dbg_show callback function which can be used to show pin
> confuration values. Basically, it can show pin setting values by
> accessing the "pins" node like below:
>
> $ cat pins
> pin 0 (gpy7-0)  CON(0x0) DAT(0x1) PUD(0x1) DRV(0x0) CON_PDN(0x0) PUD_PDN(0x0)
>
> Signed-off-by: Chanho Park <parkch98@gmail.com>
> ---
> Changes from v1:
> - use samsung_pinconf_get instead of samsung_pinconf_rw
> - use "static const char * const" type declaration of reg_names
> - skip condition change

Patch applied directly to my tree for v4.18 with the
ACKs!

Yours,
Linus Walleij
