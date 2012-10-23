From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: samsung: clock: add clock_tree debugfs file
Date: Tue, 23 Oct 2012 20:01:16 +0900
Message-ID: <01b801cdb10d$b9234500$2b69cf00$%kim@samsung.com>
References: <004a01cd8cc9$40fcd900$c2f68b00$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18026 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751969Ab2JWLBS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 07:01:18 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC00LBVEM4LF50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 20:01:16 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCC000X8EM42U90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 20:01:16 +0900 (KST)
In-reply-to: <004a01cd8cc9$40fcd900$c2f68b00$%choi@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ks_c_5601-1987?B?J8PWwb7Iryc=?= <jhbird.choi@samsung.com>, inux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Colin Cross' <ccross@android.com>

=C3=D6=C1=BE=C8=AF wrote:
>=20
> From: Colin Cross <ccross@android.com>
>=20
> Add a clock/clock_tree debugfs file that shows the entire clock
> hierarchy including usage counts and rates.
>=20
> Signed-off-by: Colin Cross <ccross@android.com>
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  arch/arm/plat-samsung/clock.c |   65
> ++++++++++++++++++++++++++++++++++++++++-
>  1 files changed, 64 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/cl=
ock.c
> index b7338ce..9392959 100644
> --- a/arch/arm/plat-samsung/clock.c
> +++ b/arch/arm/plat-samsung/clock.c
> @@ -396,6 +396,64 @@ int __init s3c24xx_register_baseclocks(unsigned =
long
> xtal)
>=20
>  static struct dentry *clk_debugfs_root;
>=20
> +static void clock_tree_show_one(struct seq_file *s, struct clk *c, i=
nt
> level)
> +{
> +       struct clk *child;
> +       const char *state;
> +       char buf[255] =3D { 0 };
> +       int n =3D 0;
> +
> +       if (c->name)
> +               n =3D snprintf(buf, sizeof(buf) - 1, "%s", c->name);
> +
> +       if (c->devname)
> +               n +=3D snprintf(buf + n, sizeof(buf) - 1 - n, ":%s", =
c-
> >devname);
> +
> +       state =3D (c->usage > 0) ? "on" : "off";
> +
> +       seq_printf(s, "%*s%-*s %-6s %-3d %-10lu\n",
> +               level * 3 + 1, "",
> +               50 - level * 3, buf,
> +               state, c->usage, clk_get_rate(c));
> +
> +       list_for_each_entry(child, &clocks, list) {
> +               if (child->parent !=3D c)
> +                       continue;
> +
> +               clock_tree_show_one(s, child, level + 1);
> +       }
> +}
> +
> +static int clock_tree_show(struct seq_file *s, void *data)
> +{
> +       struct clk *c;
> +       unsigned long flags;
> +
> +       seq_printf(s, " clock
> state  ref rate\n");
> +       seq_printf(s, "----------------------------------------------=
-----
-
> -
> ---------------\n");
> +
> +       spin_lock_irqsave(&clocks_lock, flags);
> +
> +       list_for_each_entry(c, &clocks, list)
> +               if (c->parent =3D=3D NULL)
> +                       clock_tree_show_one(s, c, 0);
> +
> +       spin_unlock_irqrestore(&clocks_lock, flags);
> +       return 0;
> +}
> +
> +static int clock_tree_open(struct inode *inode, struct file *file)
> +{
> +       return single_open(file, clock_tree_show, inode->i_private);
> +}
> +
> +static const struct file_operations clock_tree_fops =3D {
> +       .open           =3D clock_tree_open,
> +       .read           =3D seq_read,
> +       .llseek         =3D seq_lseek,
> "0001-ARM-samsung-clock-add-clock_tree-debugfs-file.patch" 106L, 2832=
C
> 1,1           Top
> +       .read           =3D seq_read,
> +       .llseek         =3D seq_lseek,
> +       .release        =3D single_release,
> +};
> +
>  static int clk_debugfs_register_one(struct clk *c)
>  {
>         int err;
> @@ -457,13 +515,18 @@ static int __init clk_debugfs_init(void)
>  {
>         struct clk *c;
>         struct dentry *d;
> -       int err;
> +       int err =3D -ENOMEM;
>=20
>         d =3D debugfs_create_dir("clock", NULL);
>         if (!d)
>                 return -ENOMEM;
>         clk_debugfs_root =3D d;
>=20
> +       d =3D debugfs_create_file("clock_tree", S_IRUGO, clk_debugfs_=
root,
> NULL,
> +               &clock_tree_fops);
> +       if (!d)
> +               goto err_out;
> +
>         list_for_each_entry(c, &clocks, list) {
>                 err =3D clk_debugfs_register(c);
>                 if (err)
> --
> 1.7.1

Applied with fixing patch format :(

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
