From: Alexey Klimov <klimov.linux@gmail.com>
Subject: Re: [PATCH 2/2] [ARM] samsung-rotator: Add Samsung S3C/S5P rotator
	driver
Date: Thu, 24 Dec 2009 01:29:17 +0300
Message-ID: <208cbae30912231429o4821ca2fm9722532b0b277865@mail.gmail.com>
References: <1261562933-26987-1-git-send-email-p.osciak@samsung.com>
	 <1261562933-26987-3-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f42.google.com ([209.85.160.42]:50040 "EHLO
	mail-pw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752654AbZLWW3S convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Dec 2009 17:29:18 -0500
In-Reply-To: <1261562933-26987-3-git-send-email-p.osciak@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pawel Osciak <p.osciak@samsung.com>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hello,

On Wed, Dec 23, 2009 at 1:08 PM, Pawel Osciak <p.osciak@samsung.com> wr=
ote:
> The rotator device present on Samsung S3C and S5P series SoCs allows =
image
> rotation and flipping. It requires contiguous memory buffers to opera=
te,
> as it does not have scatter-gather support. It is also an example of
> a memory-to-memory device, and so uses the mem-2-mem device V4L2 fram=
ework.

[...]

> +
> +static const struct v4l2_file_operations s3c_rotator_fops =3D {
> + =A0 =A0 =A0 .owner =A0 =A0 =A0 =A0 =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 .open =A0 =A0 =A0 =A0 =A0 =3D s3c_rotator_open,
> + =A0 =A0 =A0 .release =A0 =A0 =A0 =A0=3D s3c_rotator_release,
> + =A0 =A0 =A0 .poll =A0 =A0 =A0 =A0 =A0 =3D s3c_rotator_poll,
> + =A0 =A0 =A0 .ioctl =A0 =A0 =A0 =A0 =A0=3D video_ioctl2,
> + =A0 =A0 =A0 .mmap =A0 =A0 =A0 =A0 =A0 =3D s3c_rotator_mmap,
> +};
> +
> +static struct video_device m2mtest_videodev =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D S3C_ROTATOR_NAME,
> + =A0 =A0 =A0 .fops =A0 =A0 =A0 =A0 =A0 =3D &s3c_rotator_fops,
> + =A0 =A0 =A0 .ioctl_ops =A0 =A0 =A0=3D &s3c_rotator_ioctl_ops,
> + =A0 =A0 =A0 .minor =A0 =A0 =A0 =A0 =A0=3D -1,
> + =A0 =A0 =A0 .release =A0 =A0 =A0 =A0=3D video_device_release,
> +};
> +
> +static struct v4l2_m2m_ops m2m_ops =3D {
> + =A0 =A0 =A0 .device_run =A0 =A0 =3D device_run,
> + =A0 =A0 =A0 .job_abort =A0 =A0 =A0=3D job_abort,
> +};
> +
> +static int s3c_rotator_probe(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct s3c_rotator_dev *dev;
> + =A0 =A0 =A0 struct video_device *vfd;
> + =A0 =A0 =A0 struct resource *res;
> + =A0 =A0 =A0 int ret =3D -ENOENT;

Here ^^^ (see below please for comments)

> +
> + =A0 =A0 =A0 dev =3D kzalloc(sizeof *dev, GFP_KERNEL);
> + =A0 =A0 =A0 if (!dev)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> +
> + =A0 =A0 =A0 spin_lock_init(&dev->irqlock);
> + =A0 =A0 =A0 ret =3D -ENOENT;

It's probably bad pedantic part of me speaking but looks like you set
ret equals to -ENOENT two times. Most likely you don't need
assignment second time.


> + =A0 =A0 =A0 dev->irq =3D platform_get_irq(pdev, 0);
> + =A0 =A0 =A0 if (dev->irq <=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Failed to acquire =
irq\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto free_dev;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> + =A0 =A0 =A0 if (!res) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Failed to acquire memo=
ry region resource\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto free_irq;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dev->regs_res =3D request_mem_region(res->start, resour=
ce_size(res),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0dev_name(&pdev->dev));
> + =A0 =A0 =A0 if (!dev->regs_res) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Failed to reserve =
memory region\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto free_irq;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dev->regs_base =3D ioremap(res->start, resource_size(re=
s));
> + =A0 =A0 =A0 if (!dev->regs_base) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Ioremap failed\n")=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENXIO;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto rel_res;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D request_irq(dev->irq, s3c_rotator_isr, 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C_ROTATOR_NAME, d=
ev);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Requesting irq fai=
led\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto regs_unmap;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev=
);
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto regs_unmap;
> +
> + =A0 =A0 =A0 atomic_set(&dev->num_inst, 0);
> +
> + =A0 =A0 =A0 vfd =3D video_device_alloc();
> + =A0 =A0 =A0 if (!vfd) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 v4l2_err(&dev->v4l2_dev, "Failed to all=
ocate video device\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto unreg_dev;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 *vfd =3D m2mtest_videodev;
> +
> + =A0 =A0 =A0 ret =3D video_register_device(vfd, VFL_TYPE_GRABBER, 0)=
;
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 v4l2_err(&dev->v4l2_dev, "Failed to reg=
ister video device\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto rel_vdev;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 video_set_drvdata(vfd, dev);
> + =A0 =A0 =A0 snprintf(vfd->name, sizeof(vfd->name), "%s", m2mtest_vi=
deodev.name);
> + =A0 =A0 =A0 dev->vfd =3D vfd;
> + =A0 =A0 =A0 v4l2_info(&dev->v4l2_dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Device registered as /=
dev/video%d\n", vfd->num);
> +
> + =A0 =A0 =A0 platform_set_drvdata(pdev, dev);
> +
> + =A0 =A0 =A0 dev->m2m_dev =3D v4l2_m2m_init(&m2m_ops);
> + =A0 =A0 =A0 if (IS_ERR(dev->m2m_dev)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 v4l2_err(&dev->v4l2_dev, "Failed to ini=
t mem2mem device\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(dev->m2m_dev);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_m2m;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 0;
> +
> +err_m2m:
> + =A0 =A0 =A0 video_unregister_device(dev->vfd);
> +rel_vdev:
> + =A0 =A0 =A0 video_device_release(vfd);
> +unreg_dev:
> + =A0 =A0 =A0 v4l2_device_unregister(&dev->v4l2_dev);
> +regs_unmap:
> + =A0 =A0 =A0 iounmap(dev->regs_base);
> +rel_res:
> + =A0 =A0 =A0 release_resource(dev->regs_res);
> + =A0 =A0 =A0 kfree(dev->regs_res);
> +free_irq:
> + =A0 =A0 =A0 free_irq(dev->irq, dev);
> +free_dev:
> + =A0 =A0 =A0 kfree(dev);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +static int s3c_rotator_remove(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct s3c_rotator_dev *dev =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (struct s3c_rotator_dev *)platform_get_=
drvdata(pdev);
> +
> + =A0 =A0 =A0 v4l2_info(&dev->v4l2_dev, "Removing %s\n", S3C_ROTATOR_=
NAME);
> +
> + =A0 =A0 =A0 v4l2_m2m_release(dev->m2m_dev);
> + =A0 =A0 =A0 video_unregister_device(dev->vfd);
> + =A0 =A0 =A0 v4l2_device_unregister(&dev->v4l2_dev);
> + =A0 =A0 =A0 iounmap(dev->regs_base);
> + =A0 =A0 =A0 release_resource(dev->regs_res);
> + =A0 =A0 =A0 kfree(dev->regs_res);
> + =A0 =A0 =A0 free_irq(dev->irq, dev);
> + =A0 =A0 =A0 kfree(dev);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int s3c_rotator_suspend(struct device *dev)
> +{
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int s3c_rotator_resume(struct device *dev)
> +{
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static struct dev_pm_ops s3c_rotator_pm_ops =3D {
> + =A0 =A0 =A0 .suspend =3D s3c_rotator_suspend,
> + =A0 =A0 =A0 .resume =3D s3c_rotator_resume,
> +};
> +
> +static struct platform_driver s3c_rotator_pdrv =3D {
> + =A0 =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D s3c_rotator_probe,
> + =A0 =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D s3c_rotator_remove,
> + =A0 =A0 =A0 .driver =A0 =A0 =A0 =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D S3C_ROTATOR_NAME,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pm =A0 =A0 =3D &s3c_rotator_pm_ops
> + =A0 =A0 =A0 },
> +};
> +
> +static char banner[] __initdata =3D
> + =A0 =A0 =A0 KERN_INFO "S3C Rotator V4L2 Driver, (c) 2009 Samsung El=
ectronics\n";
> +
> +static int __init s3c_rotator_init(void)
> +{
> + =A0 =A0 =A0 printk(banner);
> + =A0 =A0 =A0 return platform_driver_register(&s3c_rotator_pdrv);
> +}
> +
> +static void __devexit s3c_rotator_exit(void)
> +{
> + =A0 =A0 =A0 platform_driver_unregister(&s3c_rotator_pdrv);
> +}
> +
> +module_init(s3c_rotator_init);
> +module_exit(s3c_rotator_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Pawel Osciak <p.osciak@samsung.com>");
> +MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");



--=20
Best regards, Klimov Alexey
