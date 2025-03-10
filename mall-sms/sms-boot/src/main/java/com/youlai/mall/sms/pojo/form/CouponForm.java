package com.youlai.mall.sms.pojo.form;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 优惠券表单对象
 *
 * @author haoxr
 * @date 2022/6/23
 */
@ApiModel("优惠券表单对象")
@Data
public class CouponForm {

    @ApiModelProperty("ID")
    private Long id;

    @ApiModelProperty("优惠券名称")
    private String name;

    @ApiModelProperty("优惠券类型(1:满减券;2:直减券;3:折扣券)")
    private Integer type;

    @ApiModelProperty("优惠券面值金额(单位:分)")
    private Long faceValue;

    @ApiModelProperty("优惠券折扣")
    private BigDecimal discount;

    @ApiModelProperty("优惠券码")
    private String code;

    @ApiModelProperty("使用平台(0-全平台;1-移动端;2-PC;)")
    private Integer platform;

    @ApiModelProperty("优惠券总数(-1:无限制)")
    private Integer totalCount;

    @ApiModelProperty("最低消费金额(0:无门槛)")
    private Long minPoint;

    @ApiModelProperty("每人限领张数(-1:不限制)")
    private Integer perLimit;

    @ApiModelProperty("有效期类型(1:自领取之日起有效天数;2:有效起止时间)")
    private Integer validType;

    @ApiModelProperty("自领取之日起有效天数")
    private Integer validDays;

    @ApiModelProperty("有效期开始时间")
    private Date validBeginTime;

    @ApiModelProperty("有效期截止时间")
    private Date validEndTime;

    @ApiModelProperty("使用类型(0-全场通用;1-指定商品分类;2-指定商品)")
    private Integer useType;

    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty("优惠券适用商品分类列表")
    private List<CouponSpuCategory> spuCategoryList;

    @ApiModelProperty("优惠券适用商品列表")
    private List<CouponSpu> spuList;

    @ApiModel("优惠券适用商品分类")
    @Data
    public static class CouponSpuCategory {

        private Long id;

        private Long categoryId;

        private String categoryName;

    }

    @ApiModel("优惠券适用商品")
    @Data

    public static class CouponSpu {

        private Long id;

        private Long spuId;

        private String spuName;

    }
}