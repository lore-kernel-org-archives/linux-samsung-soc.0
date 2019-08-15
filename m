From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] pinctrl: samsung: samsung: Add of_node_put() before return
Date: Thu, 15 Aug 2019 08:15:42 +0200
Message-ID: <CAJKOXPfxV9SZrjpQ1=fRcRrkE_4vYRMKPzr3+GJ6cyktZeZtYw@mail.gmail.com>
References: <20190815060914.3572-1-nishkadg.linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190815060914.3572-1-nishkadg.linux@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 15 Aug 2019 at 08:09, Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:
>
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> three places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

This is already fixed. You can base your patches on top of linux-next
to avoid duplicating effort.

Best regards,
Krzysztof
