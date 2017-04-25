From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/2] pinctrl: trivial: remove unneeded (void *) casts in
 of_match_table
Date: Wed, 26 Apr 2017 06:34:21 +0900
Message-ID: <1493156063-8446-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org




Masahiro Yamada (2):
  pinctrl: rockchip: remove unneeded (void *) casts in of_match_table
  pinctrl: samsung: remove unneeded (void *) casts in of_match_table

 drivers/pinctrl/pinctrl-rockchip.c        | 20 ++++++++++----------
 drivers/pinctrl/samsung/pinctrl-samsung.c | 20 ++++++++++----------
 2 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.7.4
