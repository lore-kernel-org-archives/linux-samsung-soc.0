From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/6] mmc: sdhci-s3c: Add support for device tree based
	probe
Date: Mon, 20 Jun 2011 10:51:24 -0600
Message-ID: <BANLkTi=peHYN4NjgYfO+X=pFVqWQHF21mA@mail.gmail.com>
References: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org>
	<1308567752-13451-5-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1308567752-13451-5-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 20, 2011 at 5:02 AM, Thomas Abraham
<thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Add of_match_table to enable sdhci-s3c driver to be probed when a compati=
ble
> sdhci device node is found in device tree.
>
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> This is temporary patch. sdhci-s3c driver has to be moved to sdhci-pltfm
> based driver.

... and the binding needs to be documented.  :-)

g.

>
> =A0drivers/mmc/host/sdhci-s3c.c | =A0 11 +++++++++++
> =A01 files changed, 11 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
> index 69e3ee3..5ccbee0 100644
> --- a/drivers/mmc/host/sdhci-s3c.c
> +++ b/drivers/mmc/host/sdhci-s3c.c
> @@ -629,6 +629,16 @@ static int sdhci_s3c_resume(struct platform_device *=
dev)
> =A0#define sdhci_s3c_resume NULL
> =A0#endif
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id s3c_sdhci_match[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "samsung,s3c-sdhci" },
> + =A0 =A0 =A0 {},
> +};
> +MODULE_DEVICE_TABLE(of, s3c_sdhci_match);
> +#else
> +#define s3c_sdhci_match NULL
> +#endif
> +
> =A0static struct platform_driver sdhci_s3c_driver =3D {
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D sdhci_s3c_probe,
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D __devexit_p(sdhci_s3c_remove),
> @@ -637,6 +647,7 @@ static struct platform_driver sdhci_s3c_driver =3D {
> =A0 =A0 =A0 =A0.driver =A0 =A0 =A0 =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =A0=3D THIS_MODULE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c-sdhci",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D s3c_sdhci_match,
> =A0 =A0 =A0 =A0},
> =A0};
>
> --
> 1.6.6.rc2
>
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
