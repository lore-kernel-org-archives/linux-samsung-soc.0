From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] ARM: S5PV210: Add support for I2C devices on SMDKV210
	and SMDKC110
Date: Mon, 19 Jul 2010 09:29:25 +0900
Message-ID: <000201cb26d9$7472a420$5d57ec60$%kim@samsung.com>
References: <1279285999-27555-1-git-send-email-kgene.kim@samsung.com>
	<1279285999-27555-3-git-send-email-kgene.kim@samsung.com>
	<AANLkTikK6qjh4yG5OX8g8Ih22SCg-2m3nUIfMDABHChf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <AANLkTikK6qjh4yG5OX8g8Ih22SCg-2m3nUIfMDABHChf@mail.gmail.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: 'Naveen Krishna Ch' <ch.naveen@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
> =

> On Fri, Jul 16, 2010 at 10:13 PM, Kukjin Kim <kgene.kim@samsung.com>
wrote:
> > From: Naveen Krishna Ch <ch.naveen@samsung.com>
> >
> > This patch adds support I2C-0/1/2 devices to the SMDKV210/SMDKC110.
> >
> > Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 | =A0 =A08 ++++++++
> > =A0arch/arm/mach-s5pv210/mach-smdkc110.c | =A0 28
> ++++++++++++++++++++++++++++
> > =A0arch/arm/mach-s5pv210/mach-smdkv210.c | =A0 29
> +++++++++++++++++++++++++++++
> > =A03 files changed, 65 insertions(+), 0 deletions(-)
> >

(snip)

> >
> > +static struct i2c_board_info smdkc100_i2c_devs0[] __initdata =3D {
> > + =A0 =A0 =A0 { I2C_BOARD_INFO("24c08", 0x50), }, =A0 =A0 /* Samsung S5=
24AD0XD1 */
> > +};
> > +
> =

> why smdkc100?
> =

Oh,...thank you for pointing out..will fix it.

> > +static struct i2c_board_info smdkc100_i2c_devs1[] __initdata =3D {
> > + =A0 =A0 =A0 /* To Be Updated */
> > +};
> > +
> Ditto
> =

> > +static struct i2c_board_info smdkc100_i2c_devs2[] __initdata =3D {
> > + =A0 =A0 =A0 /* To Be Updated */
> > +};
> Ditto
> =


(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
