From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 06/10] mfd: cros_ec: Use struct cros_ec_command to
 communicate with the EC
Date: Wed, 18 Jun 2014 08:45:32 +0100
Message-ID: <20140618074532.GF21030@lee--X1>
References: <1402954800-28215-1-git-send-email-dianders@chromium.org>
 <1402954800-28215-7-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1402954800-28215-7-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, sjg@chromium.org, Wolfram Sang <wsa@the-dreams.de>, broonie@kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 16 Jun 2014, Doug Anderson wrote:

> From: Bill Richardson <wfrichar@chromium.org>
>=20
> This is some internal structure reorganization / renaming to prepare
> for future patches that will add a userspace API to cros_ec.  There
> should be no visible changes.
>=20
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
>  drivers/mfd/cros_ec.c       | 28 ++++++++++++++--------------
>  drivers/mfd/cros_ec_i2c.c   | 24 ++++++++++++------------
>  drivers/mfd/cros_ec_spi.c   | 16 ++++++++--------
>  include/linux/mfd/cros_ec.h | 35 ++++++++++++++++++-----------------
>  4 files changed, 52 insertions(+), 51 deletions(-)
>   */
> -struct cros_ec_msg {
> -	u8 version;
> -	u8 cmd;
> -	uint8_t *out_buf;
> -	int out_len;
> -	uint8_t *in_buf;
> -	int in_len;
> +struct cros_ec_command {
> +	uint32_t version;
> +	uint32_t command;
> +	uint8_t *outdata;
> +	uint32_t outsize;
> +	uint8_t *indata;
> +	uint32_t insize;
> +	uint32_t result;

If you're sure these type changed do not cause you any bother:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
