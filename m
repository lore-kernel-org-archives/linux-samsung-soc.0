From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] mfd: use to_i2c_client
Date: Mon, 11 Jan 2016 08:00:51 +0000
Message-ID: <20160111080051.GQ3331@x1>
References: <0837727b57d573988a47f3ecb22918e9771e8dbe.1451314502.git.geliangtang@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:33924 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758149AbcAKIAz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2016 03:00:55 -0500
Received: by mail-wm0-f42.google.com with SMTP id u188so203427737wmu.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2016 00:00:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <0837727b57d573988a47f3ecb22918e9771e8dbe.1451314502.git.geliangtang@163.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Geliang Tang <geliangtang@163.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Mon, 28 Dec 2015, Geliang Tang wrote:

> Use to_i2c_client() instead of open-coding it.
>=20
> Signed-off-by: Geliang Tang <geliangtang@163.com>
> ---
>  drivers/mfd/88pm80x.c       | 4 ++--
>  drivers/mfd/88pm860x-core.c | 4 ++--
>  drivers/mfd/max14577.c      | 4 ++--
>  drivers/mfd/max77686.c      | 4 ++--
>  drivers/mfd/max77693.c      | 4 ++--
>  drivers/mfd/max77843.c      | 4 ++--
>  drivers/mfd/max8925-i2c.c   | 4 ++--
>  drivers/mfd/max8997.c       | 8 ++++----
>  drivers/mfd/max8998.c       | 8 ++++----
>  drivers/mfd/sec-core.c      | 4 ++--
>  10 files changed, 24 insertions(+), 24 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/88pm80x.c b/drivers/mfd/88pm80x.c
> index 63445ea..3f24ecb 100644
> --- a/drivers/mfd/88pm80x.c
> +++ b/drivers/mfd/88pm80x.c
> @@ -135,7 +135,7 @@ EXPORT_SYMBOL_GPL(pm80x_deinit);
>  #ifdef CONFIG_PM_SLEEP
>  static int pm80x_suspend(struct device *dev)
>  {
> -	struct i2c_client *client =3D container_of(dev, struct i2c_client, =
dev);
> +	struct i2c_client *client =3D to_i2c_client(dev);
>  	struct pm80x_chip *chip =3D i2c_get_clientdata(client);
> =20
>  	if (chip && chip->wu_flag)
> @@ -147,7 +147,7 @@ static int pm80x_suspend(struct device *dev)
> =20
>  static int pm80x_resume(struct device *dev)
>  {
> -	struct i2c_client *client =3D container_of(dev, struct i2c_client, =
dev);
> +	struct i2c_client *client =3D to_i2c_client(dev);
>  	struct pm80x_chip *chip =3D i2c_get_clientdata(client);
> =20
>  	if (chip && chip->wu_flag)
> diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.=
c
> index 3269a99..e497cee 100644
> --- a/drivers/mfd/88pm860x-core.c
> +++ b/drivers/mfd/88pm860x-core.c
> @@ -1218,7 +1218,7 @@ static int pm860x_remove(struct i2c_client *cli=
ent)
>  #ifdef CONFIG_PM_SLEEP
>  static int pm860x_suspend(struct device *dev)
>  {
> -	struct i2c_client *client =3D container_of(dev, struct i2c_client, =
dev);
> +	struct i2c_client *client =3D to_i2c_client(dev);
>  	struct pm860x_chip *chip =3D i2c_get_clientdata(client);
> =20
>  	if (device_may_wakeup(dev) && chip->wakeup_flag)
> @@ -1228,7 +1228,7 @@ static int pm860x_suspend(struct device *dev)
> =20
>  static int pm860x_resume(struct device *dev)
>  {
> -	struct i2c_client *client =3D container_of(dev, struct i2c_client, =
dev);
> +	struct i2c_client *client =3D to_i2c_client(dev);
>  	struct pm860x_chip *chip =3D i2c_get_clientdata(client);
> =20
>  	if (device_may_wakeup(dev) && chip->wakeup_flag)
> diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
> index 56e216d..2280b3f 100644
> --- a/drivers/mfd/max14577.c
> +++ b/drivers/mfd/max14577.c
> @@ -495,7 +495,7 @@ MODULE_DEVICE_TABLE(i2c, max14577_i2c_id);
>  #ifdef CONFIG_PM_SLEEP
>  static int max14577_suspend(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max14577 *max14577 =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev))
> @@ -516,7 +516,7 @@ static int max14577_suspend(struct device *dev)
> =20
>  static int max14577_resume(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max14577 *max14577 =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev))
> diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
> index d19be64..d959ebb 100644
> --- a/drivers/mfd/max77686.c
> +++ b/drivers/mfd/max77686.c
> @@ -352,7 +352,7 @@ MODULE_DEVICE_TABLE(i2c, max77686_i2c_id);
>  #ifdef CONFIG_PM_SLEEP
>  static int max77686_suspend(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max77686_dev *max77686 =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev))
> @@ -374,7 +374,7 @@ static int max77686_suspend(struct device *dev)
> =20
>  static int max77686_resume(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max77686_dev *max77686 =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev))
> diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
> index 007f729..b83b7a7 100644
> --- a/drivers/mfd/max77693.c
> +++ b/drivers/mfd/max77693.c
> @@ -334,7 +334,7 @@ MODULE_DEVICE_TABLE(i2c, max77693_i2c_id);
> =20
>  static int max77693_suspend(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max77693_dev *max77693 =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev)) {
> @@ -347,7 +347,7 @@ static int max77693_suspend(struct device *dev)
> =20
>  static int max77693_resume(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max77693_dev *max77693 =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev)) {
> diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
> index 586098f..7cfc95b 100644
> --- a/drivers/mfd/max77843.c
> +++ b/drivers/mfd/max77843.c
> @@ -197,7 +197,7 @@ MODULE_DEVICE_TABLE(i2c, max77843_id);
> =20
>  static int __maybe_unused max77843_suspend(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max77693_dev *max77843 =3D i2c_get_clientdata(i2c);
> =20
>  	disable_irq(max77843->irq);
> @@ -209,7 +209,7 @@ static int __maybe_unused max77843_suspend(struct=
 device *dev)
> =20
>  static int __maybe_unused max77843_resume(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max77693_dev *max77843 =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev))
> diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
> index b0fe810..70443b1 100644
> --- a/drivers/mfd/max8925-i2c.c
> +++ b/drivers/mfd/max8925-i2c.c
> @@ -215,7 +215,7 @@ static int max8925_remove(struct i2c_client *clie=
nt)
>  #ifdef CONFIG_PM_SLEEP
>  static int max8925_suspend(struct device *dev)
>  {
> -	struct i2c_client *client =3D container_of(dev, struct i2c_client, =
dev);
> +	struct i2c_client *client =3D to_i2c_client(dev);
>  	struct max8925_chip *chip =3D i2c_get_clientdata(client);
> =20
>  	if (device_may_wakeup(dev) && chip->wakeup_flag)
> @@ -225,7 +225,7 @@ static int max8925_suspend(struct device *dev)
> =20
>  static int max8925_resume(struct device *dev)
>  {
> -	struct i2c_client *client =3D container_of(dev, struct i2c_client, =
dev);
> +	struct i2c_client *client =3D to_i2c_client(dev);
>  	struct max8925_chip *chip =3D i2c_get_clientdata(client);
> =20
>  	if (device_may_wakeup(dev) && chip->wakeup_flag)
> diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
> index 156ed6f..f316348 100644
> --- a/drivers/mfd/max8997.c
> +++ b/drivers/mfd/max8997.c
> @@ -437,7 +437,7 @@ static u8 max8997_dumpaddr_haptic[] =3D {
> =20
>  static int max8997_freeze(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max8997_dev *max8997 =3D i2c_get_clientdata(i2c);
>  	int i;
> =20
> @@ -459,7 +459,7 @@ static int max8997_freeze(struct device *dev)
> =20
>  static int max8997_restore(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max8997_dev *max8997 =3D i2c_get_clientdata(i2c);
>  	int i;
> =20
> @@ -481,7 +481,7 @@ static int max8997_restore(struct device *dev)
> =20
>  static int max8997_suspend(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max8997_dev *max8997 =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev))
> @@ -491,7 +491,7 @@ static int max8997_suspend(struct device *dev)
> =20
>  static int max8997_resume(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max8997_dev *max8997 =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev))
> diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
> index a7afe3b..ab28b29 100644
> --- a/drivers/mfd/max8998.c
> +++ b/drivers/mfd/max8998.c
> @@ -274,7 +274,7 @@ MODULE_DEVICE_TABLE(i2c, max8998_i2c_id);
> =20
>  static int max8998_suspend(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max8998_dev *max8998 =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev))
> @@ -284,7 +284,7 @@ static int max8998_suspend(struct device *dev)
> =20
>  static int max8998_resume(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct max8998_dev *max8998 =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev))
> @@ -344,7 +344,7 @@ static struct max8998_reg_dump max8998_dump[] =3D=
 {
>  /* Save registers before hibernation */
>  static int max8998_freeze(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	int i;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(max8998_dump); i++)
> @@ -357,7 +357,7 @@ static int max8998_freeze(struct device *dev)
>  /* Restore registers after hibernation */
>  static int max8998_restore(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	int i;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(max8998_dump); i++)
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index c9802ba..400e1d7 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -536,7 +536,7 @@ static void sec_pmic_shutdown(struct i2c_client *=
i2c)
>  #ifdef CONFIG_PM_SLEEP
>  static int sec_pmic_suspend(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct sec_pmic_dev *sec_pmic =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev))
> @@ -557,7 +557,7 @@ static int sec_pmic_suspend(struct device *dev)
> =20
>  static int sec_pmic_resume(struct device *dev)
>  {
> -	struct i2c_client *i2c =3D container_of(dev, struct i2c_client, dev=
);
> +	struct i2c_client *i2c =3D to_i2c_client(dev);
>  	struct sec_pmic_dev *sec_pmic =3D i2c_get_clientdata(i2c);
> =20
>  	if (device_may_wakeup(dev))

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
