From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 21/23] staging: mt29f_spinand: switch to mtd_ooblayout_ops
Date: Tue, 8 Dec 2015 10:59:53 +1100
Message-ID: <CAGRGNgV09JJ7+hDVJwZcp89nEsgNS6r2Mo1_R+EEAT9=aR-Z_g@mail.gmail.com>
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
 <1449527178-5930-22-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQIP76OUQLBBDF3TCZQKGQENTEIHNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1449527178-5930-22-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, linux-kernel@v
List-Id: linux-samsung-soc@vger.kernel.org

Hi Boris,

On Tue, Dec 8, 2015 at 9:26 AM, Boris Brezillon
<boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/staging/mt29f_spinand/mt29f_spinand.c | 44 ++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
> index cb9d5ab..967d50a 100644
> --- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
> +++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
> @@ -42,23 +42,29 @@ static inline struct spinand_state *mtd_to_state(struct mtd_info *mtd)
>  static int enable_hw_ecc;
>  static int enable_read_hw_ecc;
>
> -static struct nand_ecclayout spinand_oob_64 = {
> -       .eccbytes = 24,
> -       .eccpos = {
> -               1, 2, 3, 4, 5, 6,
> -               17, 18, 19, 20, 21, 22,
> -               33, 34, 35, 36, 37, 38,
> -               49, 50, 51, 52, 53, 54, },
> -       .oobfree = {
> -               {.offset = 8,
> -                       .length = 8},
> -               {.offset = 24,
> -                       .length = 8},
> -               {.offset = 40,
> -                       .length = 8},
> -               {.offset = 56,
> -                       .length = 8},
> -       }
> +static int spinand_oob_64_eccpos(struct mtd_info *mtd, int eccbyte)
> +{
> +       if (eccbyte > 23)
> +               return -ERANGE;
> +
> +       return ((eccbyte / 6) * 16) + 1;

Are you sure this is correct? My reading of this is that we'd get 1
for eccbytes 0 through 5.

Would

((eccbyte / 6) * 16) + (eccbyte % 6) + 1

be more correct?

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
